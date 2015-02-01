require 'rails_helper'

RSpec.describe "images/new", :type => :view do
  before(:each) do
    assign(:image, Image.new(
      name: "image_one.jpg",
      url: "http://www.example.com/image_one.jpg",
      image_blob: "a",
      retrieval_time: Time.now.to_i
    ))
  end

  it "renders new image form" do
    render

    assert_select "form[action=?][method=?]", images_path, "post" do

      assert_select "input#image_name[name=?]", "image[name]"
    end
  end
end
