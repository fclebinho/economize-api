require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /add_entry" do
    it "returns http success" do
      get "/users/add_entry"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /remove_entry" do
    it "returns http success" do
      get "/users/remove_entry"
      expect(response).to have_http_status(:success)
    end
  end

end
