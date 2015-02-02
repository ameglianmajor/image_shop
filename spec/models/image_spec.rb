require 'rails_helper'

RSpec.describe Image, :type => :model do
  before(:each) do
    test_image_path = 'spec/test_files/peace.jpeg'
    full_image_path = Rails.root.join(test_image_path)
    @test_image = ::Magick::Image.read(full_image_path)[0]
    @test_image_url = 'http://www.clipartbest.com/cliparts/KTj/49G/KTj49GATq.jpeg'
    @image = Image.new(
      name: "White Dove Peace Picture",
      image_blob: Base64.encode64(@test_image.to_blob),
      url: URI::encode(@test_image_url),
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
      new_width = '400'
      new_height = '400'
      resized_image_blob = @image.resize_image(new_width,new_height)
      resized_image = ::Magick::ImageList.new()
      resized_image.from_blob(resized_image_blob)
      expect(resized_image.columns).to eq(new_width.to_i)
      expect(resized_image.rows).to eq(new_height.to_i)
    end

    it "calls crop_image when the crop endpoint is invoked" do
      upper_left_corner = {x: '50', y: '50'}
      new_width = '150'
      new_height = '150'
      cropped_image_blob =
        @image.crop_image(upper_left_corner, new_width, new_height)
      cropped_image = ::Magick::ImageList.new()
      cropped_image.from_blob(cropped_image_blob)
      expect(cropped_image.columns).to eq(new_width.to_i)
      expect(cropped_image.rows).to eq(new_height.to_i)
    end
  end

  context "when a valid image_blob is not present" do
    it "retrieves the image from the url" do
      image_width = 367
      image_height = 350

      stub_request(:get, @test_image_url).
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.1'}).
        to_return(
          status: :ok,
          body: @test_image.to_blob,
          :headers => { 'Content-Type' => 'image/jpeg' }
        )

      retrieved_image_model = Image.retrieve(@test_image_url)
      retrieved_image = ::Magick::ImageList.new()
      retrieved_image.from_blob(
        Base64.decode64(retrieved_image_model.image_blob)
      )
      expect(retrieved_image.columns).to eq(image_width)
      expect(retrieved_image.rows).to eq(image_height)
    end
  end

end
