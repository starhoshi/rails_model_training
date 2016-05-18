require "rails_helper"

RSpec.describe SongHistoriesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/song_histories").to route_to("song_histories#index")
    end

    it "routes to #new" do
      expect(:get => "/song_histories/new").to route_to("song_histories#new")
    end

    it "routes to #show" do
      expect(:get => "/song_histories/1").to route_to("song_histories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/song_histories/1/edit").to route_to("song_histories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/song_histories").to route_to("song_histories#create")
    end

    it "routes to #update" do
      expect(:put => "/song_histories/1").to route_to("song_histories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/song_histories/1").to route_to("song_histories#destroy", :id => "1")
    end

  end
end
