require 'rails_helper'

RSpec.describe "playlist_songs/index", :type => :view do
  before(:each) do
    assign(:playlist_songs, [
      PlaylistSong.create!(
        :playlist => nil,
        :song => nil
      ),
      PlaylistSong.create!(
        :playlist => nil,
        :song => nil
      )
    ])
  end

  it "renders a list of playlist_songs" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
