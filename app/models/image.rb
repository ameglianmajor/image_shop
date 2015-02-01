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
    super
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
    if image.retrieval_time < 5.minutes.ago.to_i
      image.retrieve_image
      image.save!
    end
    image
  end

  def resize_image(new_width, new_height)
    width = new_width.to_i
    height = new_height.to_i
    resized_image = ::Magick::ImageList.new
    resized_image.from_blob(Base64.decode64(image_blob))
    resized_image.resize!(width, height)
    resized_image.to_blob
  end

  def crop_image(upper_left_corner, cropped_width, cropped_height)
    width = cropped_width.to_i
    height = cropped_height.to_i
    # The line of code below was written as it was to remove
    # the dependency on the chosen names for the x and y coordinates
    # in the upper_left_corner hash.
    x_coordinate, y_coordinate = upper_left_corner.values.map(&:to_i)
    cropped_image = ::Magick::ImageList.new
    cropped_image.from_blob(Base64.decode64(image_blob))
    cropped_image.crop!(x_coordinate, y_coordinate, width, height)
    cropped_image.to_blob
  end

  def retrieve_image
    fetcher = ::FileFetcher::Base.new
    response = fetcher.get_image(url)
    self.retrieval_time = Time.now.to_i
    self.image_blob = Base64.encode64(response.body)
    self.content_type = response.env[:response_headers]['content-type']
  end

  def self.name_from_url(url)
    url.split('/').last if url
  end
end
