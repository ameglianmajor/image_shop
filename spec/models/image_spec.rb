require 'rails_helper'

RSpec.describe Image, :type => :model do
  before(:each) do
    test_image_path = 'spec/test_files/peace.jpeg'
    full_image_path = Rails.root.join(test_image_path)
    test_image = ::Magick::Image.read(full_image_path)[0]
    test_image_url = 'http://www.clipartbest.com/cliparts/KTj/49G/KTj49GATq.jpeg'
    @image = Image.new(
      name: "White Dove Peace Picture",
      image_blob: Base64.encode64(test_image.to_blob),
      url: URI::encode(test_image_url),
      content_type: 'image/jpeq',
      # Time since last Epoch (0:00 on January 1, 1970)
      # Since we are caching and users will not be in the same time zone,
      # the retrieval time should be time zone independent.
      retrieval_time: Time.now.to_i
    )
  end

  it "is valid with valid attributes" do
    @image.should be_valid
  end

  it "is not valid without a url" do
    @image.url = nil
    @image.should_not be_valid
  end

  it "is not valid without an image_blob" do
    @image.image_blob = nil
    @image.should_not be_valid
  end

  it "is not valid without a retrieval time" do
    @image.retrieval_time = nil
    @image.should_not be_valid
  end

  context "when a valid image_blob is present" do
    it "calls resize_image when the resize endpoint is invoked" do
      new_width = 400
      new_height = 400
      resized_image_blob = @image.resize_image(new_width,new_height)
      resized_image = ::Magick::ImageList.new()
      resized_image.from_blob(resized_image_blob)
      expect(resized_image.columns).to eq(new_width)
      expect(resized_image.rows).to eq(new_height)
    end

    it "calls crop_image when the crop endpoint is invoked" do
      x = 50
      y = 50
      new_width = 150
      new_height = 150
      cropped_image_blob =
        @image.crop_image({x: x, y: y}, new_width, new_height)
      cropped_image = ::Magick::ImageList.new()
      cropped_image.from_blob(cropped_image_blob)
      expect(cropped_image.columns).to eq(new_width)
      expect(cropped_image.rows).to eq(new_height)
    end
  end

  context "when a valid image_blob is not present" do

  end

end
