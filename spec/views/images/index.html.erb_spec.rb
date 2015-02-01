require 'rails_helper'

RSpec.describe "images/index", :type => :view do
  before(:each) do
    assign(:images, [
      Image.create!(
        name: "Image Name",
        url: "http://www.example.com/image_one.jpg",
        image_blob: "a",
        retrieval_time: Time.now.to_i
      ),
      Image.create!(
        name: "Image Name",
        url: "http://www.example.com/image_two.jpg",
        image_blob: "a",
        retrieval_time: Time.now.to_i
      )
    ])
  end

  it "renders a list of images" do
    render
    assert_select "tr>td", :text => "Image Name".to_s, :count => 2
  end
end
