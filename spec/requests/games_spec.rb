require "rails_helper"

RSpec.describe "Games", type: :request do
  describe "GET /games" do
    it "returns a successful response" do
      get games_path

      expect(response).to have_http_status(:success)
    end

    it "displays games" do
      game = create(:game, name: "Halo 3")

      get games_path

      expect(response.body).to include("Halo 3")
    end
  end
end