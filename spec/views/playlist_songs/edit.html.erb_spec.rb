require 'rails_helper'

RSpec.describe "playlist_songs/edit", :type => :view do
  before(:each) do
    @playlist_song = assign(:playlist_song, PlaylistSong.create!(
      :playlist => nil,
      :song => nil
    ))
  end

  it "renders the edit playlist_song form" do
    render

    assert_select "form[action=?][method=?]", playlist_song_path(@playlist_song), "post" do

      assert_select "input#playlist_song_playlist_id[name=?]", "playlist_song[playlist_id]"

      assert_select "input#playlist_song_song_id[name=?]", "playlist_song[song_id]"
    end
  end
end
