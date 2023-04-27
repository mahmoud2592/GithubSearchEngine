require 'rails_helper'

RSpec.describe "Repositories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/repositories/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/repositories/show"
      expect(response).to have_http_status(:success)
    end
  end

end
