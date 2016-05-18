require 'rails_helper'

RSpec.describe "songs/edit", :type => :view do
  before(:each) do
    @song = assign(:song, Song.create!(
      :title => "",
      :artist => "MyText"
    ))
  end

  it "renders the edit song form" do
    render

    assert_select "form[action=?][method=?]", song_path(@song), "post" do

      assert_select "input#song_title[name=?]", "song[title]"

      assert_select "textarea#song_artist[name=?]", "song[artist]"
    end
  end
end
