require 'rails_helper'

RSpec.describe "devices/show", :type => :view do
  before(:each) do
    @device = assign(:device, Device.create!(
      :user => nil,
      :os => "Os",
      :model => "Model",
      :push_token => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Os/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/MyText/)
  end
end
