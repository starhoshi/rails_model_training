require 'rails_helper'

RSpec.describe "song_histories/show", :type => :view do
  before(:each) do
    @song_history = assign(:song_history, SongHistory.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Media/)
    expect(rendered).to match(/Track Source/)
    expect(rendered).to match(/Album/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Genre/)
    expect(rendered).to match(/Album Art Uri/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Record Type/)
  end
end
