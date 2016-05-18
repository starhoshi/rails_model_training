require 'rails_helper'

RSpec.describe "push_tokens/index", :type => :view do
  before(:each) do
    assign(:push_tokens, [
      PushToken.create!(
        :user => nil,
        :os => "Os",
        :push_token => "Push Token"
      ),
      PushToken.create!(
        :user => nil,
        :os => "Os",
        :push_token => "Push Token"
      )
    ])
  end

  it "renders a list of push_tokens" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Os".to_s, :count => 2
    assert_select "tr>td", :text => "Push Token".to_s, :count => 2
  end
end
