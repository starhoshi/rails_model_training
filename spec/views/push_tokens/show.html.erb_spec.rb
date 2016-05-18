require 'rails_helper'

RSpec.describe "push_tokens/show", :type => :view do
  before(:each) do
    @push_token = assign(:push_token, PushToken.create!(
      :user => nil,
      :os => "Os",
      :push_token => "Push Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Os/)
    expect(rendered).to match(/Push Token/)
  end
end
