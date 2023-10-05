require 'rails_helper'

RSpec.describe CharactersController, type: :controller do
  let(:character) { FactoryBot.create(:character) }
  let(:pokemon) { FactoryBot.create(:pokemon) }


  describe "POST #create" do
    it "creates a new character with valid params" do
      post :create, params: { character: { name: character.name, age: character.age, gender: character.gender } }

      expect(response).to redirect_to(Character.last)
      expect(flash[:notice]).to eq("Character succesfully created.")
    end

    it "renders 'new' template with invalid params" do
      post :create, params: { character: { name: "A", age: 20, gender: "invalid" } }

      expect(response).to render_template("new")
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "GET #show" do
    it "assigns the character to @character_view" do
      get :show, params: { id: character.id }

      expect(assigns(:character_view)).to be_instance_of(CharacterView)
    end
  end

  describe "POST #throw_pokeball" do
    it "returns a boolean for validating the capture status" do
      post :throw_pokeball, params: { id: character.id, pokemon_id: pokemon.id }
      json_response = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(json_response).to be_in([true, false])

    end
  end
end