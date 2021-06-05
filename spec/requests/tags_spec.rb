require 'rails_helper'

RSpec.describe "Tags", type: :request do
  describe "GET /add_to_entry" do
    it "returns http success" do
      get "/tags/add_to_entry"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /remove_from_entry" do
    it "returns http success" do
      get "/tags/remove_from_entry"
      expect(response).to have_http_status(:success)
    end
  end

end
