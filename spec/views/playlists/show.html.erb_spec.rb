require 'rails_helper'

RSpec.describe "playlists/show", :type => :view do
  before(:each) do
    @playlist = assign(:playlist, Playlist.create!(
      :user => nil,
      :name => "Name",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
  end
end
