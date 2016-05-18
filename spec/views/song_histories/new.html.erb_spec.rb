require 'rails_helper'

RSpec.describe "song_histories/new", :type => :view do
  before(:each) do
    assign(:song_history, SongHistory.new(
      :user => nil,
      :song => nil,
      :device => nil,
      :media_id => "MyString",
      :track_source => "MyString",
      :album => "MyString",
      :duration => 1,
      :genre => "MyString",
      :album_art_uri => "MyString",
      :track_number => 1,
      :num_tracks => 1,
      :point => "",
      :accuracy => 1.5,
      :altitude => 1.5,
      :record_type => "MyString"
    ))
  end

  it "renders new song_history form" do
    render

    assert_select "form[action=?][method=?]", song_histories_path, "post" do

      assert_select "input#song_history_user_id[name=?]", "song_history[user_id]"

      assert_select "input#song_history_song_id[name=?]", "song_history[song_id]"

      assert_select "input#song_history_device_id[name=?]", "song_history[device_id]"

      assert_select "input#song_history_media_id[name=?]", "song_history[media_id]"

      assert_select "input#song_history_track_source[name=?]", "song_history[track_source]"

      assert_select "input#song_history_album[name=?]", "song_history[album]"

      assert_select "input#song_history_duration[name=?]", "song_history[duration]"

      assert_select "input#song_history_genre[name=?]", "song_history[genre]"

      assert_select "input#song_history_album_art_uri[name=?]", "song_history[album_art_uri]"

      assert_select "input#song_history_track_number[name=?]", "song_history[track_number]"

      assert_select "input#song_history_num_tracks[name=?]", "song_history[num_tracks]"

      assert_select "input#song_history_point[name=?]", "song_history[point]"

      assert_select "input#song_history_accuracy[name=?]", "song_history[accuracy]"

      assert_select "input#song_history_altitude[name=?]", "song_history[altitude]"

      assert_select "input#song_history_record_type[name=?]", "song_history[record_type]"
    end
  end
end
