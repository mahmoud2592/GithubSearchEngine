require 'rails_helper'

RSpec.describe "Commits", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/commits/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/commits/show"
      expect(response).to have_http_status(:success)
    end
  end

end
