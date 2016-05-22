require 'rails_helper'

RSpec.describe "playlists/new", :type => :view do
  before(:each) do
    assign(:playlist, Playlist.new(
      :user => nil,
      :name => "MyString",
      :active => false
    ))
  end

  it "renders new playlist form" do
    render

    assert_select "form[action=?][method=?]", playlists_path, "post" do

      assert_select "input#playlist_user_id[name=?]", "playlist[user_id]"

      assert_select "input#playlist_name[name=?]", "playlist[name]"

      assert_select "input#playlist_active[name=?]", "playlist[active]"
    end
  end
end
