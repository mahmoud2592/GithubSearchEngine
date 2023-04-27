require 'rails_helper'

RSpec.describe "FilterValues", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/filter_values/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/filter_values/show"
      expect(response).to have_http_status(:success)
    end
  end

end
