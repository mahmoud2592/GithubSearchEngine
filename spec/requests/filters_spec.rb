require 'rails_helper'

RSpec.describe "Filters", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/filters/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/filters/show"
      expect(response).to have_http_status(:success)
    end
  end

end
