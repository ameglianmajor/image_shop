require 'rails_helper'

RSpec.describe "images/edit", :type => :view do
  before(:each) do
    @image = assign(:image, Image.create!(
      name: "MyString",
      url: "http://www.example.com",
      image_blob: ""
    ))
  end

  it "renders the edit image form" do
    render
    #assert_select "form[action=?][method=?]", image_path(@image), "post" do
      #assert_select "input#image_title[name=?]", "image[title]"
    #end
  end
end
