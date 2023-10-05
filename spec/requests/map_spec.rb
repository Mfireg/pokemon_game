require 'rails_helper'

RSpec.describe MapController, type: :request do
  let(:character) { FactoryBot.create(:character) }

  describe "GET #index" do
    it "returns a successful response" do
      get map_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #walk" do
    it "redirects to battle with a notice if a Pokemon appears" do
      allow_any_instance_of(Character).to receive(:get_into_grass).and_return("A Pokemon has appeared.")
      post walk_around_path(character_id: character.id)

      expect(response).to redirect_to(battle_path(pokemon: "A Pokemon has appeared."))
      expect(flash[:notice]).to eq("A Pokemon has appeared.")
    end

    it "renders the 'walk' template if no Pokemon appears" do
      allow_any_instance_of(Character).to receive(:get_into_grass).and_return("Nothing is here")
      post walk_around_path(character_id: character.id)

      expect(response).to render_template(:index)
    end
  end

  describe "GET #battle" do
    it "returns a successful response" do
      get battle_path
      expect(response).to have_http_status(:success)
    end
  end
end
