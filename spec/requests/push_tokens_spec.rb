require 'rails_helper'

RSpec.describe "PushTokens", :type => :request do
  describe "GET /push_tokens" do
    it "works! (now write some real specs)" do
      get push_tokens_path
      expect(response).to have_http_status(200)
    end
  end
end
