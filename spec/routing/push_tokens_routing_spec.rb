require "rails_helper"

RSpec.describe PushTokensController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/push_tokens").to route_to("push_tokens#index")
    end

    it "routes to #new" do
      expect(:get => "/push_tokens/new").to route_to("push_tokens#new")
    end

    it "routes to #show" do
      expect(:get => "/push_tokens/1").to route_to("push_tokens#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/push_tokens/1/edit").to route_to("push_tokens#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/push_tokens").to route_to("push_tokens#create")
    end

    it "routes to #update" do
      expect(:put => "/push_tokens/1").to route_to("push_tokens#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/push_tokens/1").to route_to("push_tokens#destroy", :id => "1")
    end

  end
end
