require 'rails_helper'

RSpec.describe "songs/index", :type => :view do
  before(:each) do
    assign(:songs, [
      Song.create!(
        :title => "",
        :artist => "MyText"
      ),
      Song.create!(
        :title => "",
        :artist => "MyText"
      )
    ])
  end

  it "renders a list of songs" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
