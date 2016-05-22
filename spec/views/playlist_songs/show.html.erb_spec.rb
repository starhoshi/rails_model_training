require 'rails_helper'

RSpec.describe "playlist_songs/show", :type => :view do
  before(:each) do
    @playlist_song = assign(:playlist_song, PlaylistSong.create!(
      :playlist => nil,
      :song => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
