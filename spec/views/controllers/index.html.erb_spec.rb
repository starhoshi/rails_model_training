require 'rails_helper'

RSpec.describe "controllers/index", :type => :view do
  before(:each) do
    assign(:controllers, [
      Controller.create!(
        :me => "Me"
      ),
      Controller.create!(
        :me => "Me"
      )
    ])
  end

  it "renders a list of controllers" do
    render
    assert_select "tr>td", :text => "Me".to_s, :count => 2
  end
end
