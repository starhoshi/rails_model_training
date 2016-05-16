require 'rails_helper'

RSpec.describe "controllers/show", :type => :view do
  before(:each) do
    @controller = assign(:controller, Controller.create!(
      :me => "Me"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Me/)
  end
end
