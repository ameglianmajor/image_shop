class Image < ActiveRecord::Base
  def retrieve_image
    fetcher = ::FileFetcher::Base.new
    response = fetcher.get_image(url)
    self.image_blob = Base64.encode64(response.body)
    response.env[:response_headers]['content-type']
  end

  def resize_image(new_width, new_height)
    width = new_width.to_i
    height = new_height.to_i
    processed_image = ::Magick::ImageList.new
    processed_image.from_blob( Base64.decode64(image_blob) )
    processed_image.resize!(width, height)
    processed_image_blob = processed_image.to_blob
    processed_image_blob
  end
end
