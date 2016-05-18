require 'rails_helper'

RSpec.describe "SongHistories", :type => :request do
  describe "GET /song_histories" do
    it "works! (now write some real specs)" do
      get song_histories_path
      expect(response).to have_http_status(200)
    end
  end
end
