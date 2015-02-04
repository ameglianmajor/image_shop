require 'image_shop/exceptions'

# The Image model stores images as blobs. It tracks the url
# from which the image was obtained. The time it was retrieved
# and a name that was given to the image. The name can
# be modified and is given a default value that comes from the url.
# This model contains the retrieval logic as well as image
# manipulation logic.
class Image < ActiveRecord::Base
  validates_presence_of :url, :image_blob, :retrieval_time

  # Retrieval time is an integer, which measures time since
  # the beginning of the Epoch, which is
  # 0:00 on January 1st, 1970

  def initialize(attributes = {})
    super attributes
    self.name ||= self.class.name_from_url(url)
    # Since the image has not been retrieved, it
    # is being set to -1, which is before the Epoch has begun.
    # The fact that the image has not been retrieved is
    # deduced from the fact retrieval_time is nil.
    self.retrieval_time ||= -1
  end

  def self.retrieve(url)
    image = find_by(url: url)
    image ||= Image.new(url: url)
    # The database cache is set to 5 minutes. This should
    # be an order of magnitude greater than the CDN caching time.
    if image.retrieval_time < (database_image_storage_time).ago.to_i
      image.retrieve_image
      image.save!
    end
    image
  end

  def resize_image(new_width, new_height)
    raise_exception_for_invalid_resize_parameters(new_width.to_i, new_height.to_i)
    width = new_width.to_i
    height = new_height.to_i
    resized_image = ::Magick::ImageList.new
    resized_image.from_blob(Base64.decode64(image_blob))
    resized_image.resize!(width, height)
    resized_image.to_blob
  end

  def crop_image(upper_left_corner, cropped_width, cropped_height)
    # The line of code below was written as it was to remove
    # the dependency on the chosen names for the x and y coordinates
    # in the upper_left_corner hash.
    x_coordinate, y_coordinate = upper_left_corner.values.map(&:to_i)
    image_in_storage = ::Magick::ImageList.new
    image_in_storage.from_blob(Base64.decode64(image_blob))
    raise_exception_for_invalid_crop_parameters(
      cropped_width.to_i,
      cropped_height.to_i,
      x_coordinate.to_i,
      y_coordinate.to_i,
      image_in_storage.columns,
      image_in_storage.rows
    )
    cropped_image = image_in_storage.crop(
      x_coordinate,
      y_coordinate,
      cropped_width.to_i,
      cropped_height.to_i
    )
    cropped_image.to_blob
  end

  def retrieve_image
    fetcher = ::FileFetcher::Base.new
    response = fetcher.get_image(self.url)
    raise ::ImageShop::ImageUnretrievable.new("#{self.url}") if ([301,302,404].include? response.status)
    self.retrieval_time = Time.now.to_i
    self.image_blob = Base64.encode64(response.body)
    self.content_type = response.env[:response_headers]['content-type']
  end

    private

    def raise_exception_for_invalid_crop_parameters(
      cropped_width,
      cropped_height,
      x_coordinate,
      y_coordinate,
      image_width,
      image_height
    )
      constraint_satisfied =
        (cropped_width + x_coordinate <= image_width) && (cropped_height + y_coordinate <= image_height)
      raise ::ImageShop::CropConstraintError unless constraint_satisfied
    end

    def raise_exception_for_invalid_resize_parameters(new_width, new_height)
      raise ::ImageShop::ValueError.new(
        'new_width',
        new_width,
        "The new width is unreasonably large. Please choose a smaller value."
      ) if new_width > self.class.max_resize_width
      raise ::ImageShop::ValueError.new(
        'new_height',
        new_height,
        "The new height is unreasonably large. Please choose a smaller value."
      ) if new_height > self.class.max_resize_height
    end

    def self.max_resize_width
      @database_image_storage_time ||= Rails.application.config.maximum_resize_width
    end

    def self.max_resize_height
      @database_image_storage_time ||= Rails.application.config.maximum_resize_height
    end

    def self.database_image_storage_time
      @database_image_storage_time ||= Rails.application.config.database_image_storage_time
    end

    def self.name_from_url(url)
      url.split('/').last if url
    end
end
