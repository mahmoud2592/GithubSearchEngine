require 'rails_helper'

RSpec.describe "SortingOptions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/sorting_options/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/sorting_options/show"
      expect(response).to have_http_status(:success)
    end
  end

end
