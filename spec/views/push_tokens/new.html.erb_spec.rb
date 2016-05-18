require 'rails_helper'

RSpec.describe "push_tokens/new", :type => :view do
  before(:each) do
    assign(:push_token, PushToken.new(
      :user => nil,
      :os => "MyString",
      :push_token => "MyString"
    ))
  end

  it "renders new push_token form" do
    render

    assert_select "form[action=?][method=?]", push_tokens_path, "post" do

      assert_select "input#push_token_user_id[name=?]", "push_token[user_id]"

      assert_select "input#push_token_os[name=?]", "push_token[os]"

      assert_select "input#push_token_push_token[name=?]", "push_token[push_token]"
    end
  end
end
