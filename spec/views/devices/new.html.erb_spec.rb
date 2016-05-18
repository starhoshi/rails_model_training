require 'rails_helper'

RSpec.describe "devices/new", :type => :view do
  before(:each) do
    assign(:device, Device.new(
      :user => nil,
      :os => "MyString",
      :model => "MyString",
      :push_token => "MyText"
    ))
  end

  it "renders new device form" do
    render

    assert_select "form[action=?][method=?]", devices_path, "post" do

      assert_select "input#device_user_id[name=?]", "device[user_id]"

      assert_select "input#device_os[name=?]", "device[os]"

      assert_select "input#device_model[name=?]", "device[model]"

      assert_select "textarea#device_push_token[name=?]", "device[push_token]"
    end
  end
end
