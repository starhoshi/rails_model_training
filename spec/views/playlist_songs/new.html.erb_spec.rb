require 'rails_helper'

RSpec.describe "playlist_songs/new", :type => :view do
  before(:each) do
    assign(:playlist_song, PlaylistSong.new(
      :playlist => nil,
      :song => nil
    ))
  end

  it "renders new playlist_song form" do
    render

    assert_select "form[action=?][method=?]", playlist_songs_path, "post" do

      assert_select "input#playlist_song_playlist_id[name=?]", "playlist_song[playlist_id]"

      assert_select "input#playlist_song_song_id[name=?]", "playlist_song[song_id]"
    end
  end
end
