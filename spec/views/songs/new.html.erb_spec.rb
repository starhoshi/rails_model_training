require 'rails_helper'

RSpec.describe "songs/new", :type => :view do
  before(:each) do
    assign(:song, Song.new(
      :title => "MyText",
      :artist => "MyText"
    ))
  end

  it "renders new song form" do
    render

    assert_select "form[action=?][method=?]", songs_path, "post" do

      assert_select "textarea#song_title[name=?]", "song[title]"

      assert_select "textarea#song_artist[name=?]", "song[artist]"
    end
  end
end
