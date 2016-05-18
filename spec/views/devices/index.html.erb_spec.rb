require 'rails_helper'

RSpec.describe "devices/index", :type => :view do
  before(:each) do
    assign(:devices, [
      Device.create!(
        :user => nil,
        :os => "Os",
        :model => "Model",
        :push_token => "MyText"
      ),
      Device.create!(
        :user => nil,
        :os => "Os",
        :model => "Model",
        :push_token => "MyText"
      )
    ])
  end

  it "renders a list of devices" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Os".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
