require 'rails_helper'

RSpec.describe "images/index", :type => :view do
  before(:each) do
    assign(:images, [
      Image.create!(
        :title => "Title"
      ),
      Image.create!(
        :title => "Title"
      )
    ])
  end

  it "renders a list of images" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
