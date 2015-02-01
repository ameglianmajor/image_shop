class Image < ActiveRecord::Base
  validates_presence_of :url, :image_blob, :retrieval_time

  # Retrieval time is an integer, which measures time since
  # the beginning of the Epoch, which is
  # 0:00 on January 1st, 1970

  def self.retrieve url
    image = find_by(url: url)
    unless image
      image = Image.new
      image.url = url
      image.name = name_from_url(url)
      # Since the image has not been retrieved, it
      # is being set to -1, which is before the Epoch has begun.
      image.retrieval_time = -1
    end
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
    resized_image.from_blob( Base64.decode64(image_blob) )
    resized_image.resize!(width, height)
    resized_image_blob = resized_image.to_blob
    resized_image_blob
  end

  def crop_image(upper_left_corner, cropped_width, cropped_height)
    width = cropped_width.to_i
    height = cropped_width.to_i
    x = upper_left_corner[:x].to_i
    y = upper_left_corner[:y].to_i
    cropped_image = ::Magick::ImageList.new
    cropped_image.from_blob( Base64.decode64(image_blob) )
    cropped_image.crop!(x, y, width, height)
    cropped_image_blob = cropped_image.to_blob
    cropped_image_blob
  end

  def retrieve_image
    fetcher = ::FileFetcher::Base.new
    response = fetcher.get_image(url)
    self.retrieval_time = Time.now.to_i
    self.image_blob = Base64.encode64(response.body)
    self.content_type = response.env[:response_headers]['content-type']
  end

  private

  def self.name_from_url url
    url.split('/').last
  end

end
