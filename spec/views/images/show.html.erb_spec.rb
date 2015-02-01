require 'rails_helper'

RSpec.describe "images/show", :type => :view do
  before(:each) do
    @image = assign(:image, Image.create!(
      name: "image_one.jpg",
      url: "http://www.example.com/image_one.jpg",
      image_blob: "a",
      retrieval_time: Time.now.to_i
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
