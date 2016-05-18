require 'rails_helper'

RSpec.describe "song_histories/index", :type => :view do
  before(:each) do
    assign(:song_histories, [
      SongHistory.create!(
        :user => nil,
        :song => nil,
        :device => nil,
        :media_id => "Media",
        :track_source => "Track Source",
        :album => "Album",
        :duration => 1,
        :genre => "Genre",
        :album_art_uri => "Album Art Uri",
        :track_number => 2,
        :num_tracks => 3,
        :point => "",
        :accuracy => 1.5,
        :altitude => 1.5,
        :record_type => "Record Type"
      ),
      SongHistory.create!(
        :user => nil,
        :song => nil,
        :device => nil,
        :media_id => "Media",
        :track_source => "Track Source",
        :album => "Album",
        :duration => 1,
        :genre => "Genre",
        :album_art_uri => "Album Art Uri",
        :track_number => 2,
        :num_tracks => 3,
        :point => "",
        :accuracy => 1.5,
        :altitude => 1.5,
        :record_type => "Record Type"
      )
    ])
  end

  it "renders a list of song_histories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Media".to_s, :count => 2
    assert_select "tr>td", :text => "Track Source".to_s, :count => 2
    assert_select "tr>td", :text => "Album".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Genre".to_s, :count => 2
    assert_select "tr>td", :text => "Album Art Uri".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Record Type".to_s, :count => 2
  end
end
