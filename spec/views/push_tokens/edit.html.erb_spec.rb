require 'rails_helper'

RSpec.describe "push_tokens/edit", :type => :view do
  before(:each) do
    @push_token = assign(:push_token, PushToken.create!(
      :user => nil,
      :os => "MyString",
      :push_token => "MyString"
    ))
  end

  it "renders the edit push_token form" do
    render

    assert_select "form[action=?][method=?]", push_token_path(@push_token), "post" do

      assert_select "input#push_token_user_id[name=?]", "push_token[user_id]"

      assert_select "input#push_token_os[name=?]", "push_token[os]"

      assert_select "input#push_token_push_token[name=?]", "push_token[push_token]"
    end
  end
end
