require 'rails_helper'

RSpec.describe "Buddies", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/buddies/index"
      expect(response).to have_http_status(:success)
    end
  end

end
