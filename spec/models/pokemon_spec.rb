require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  let(:pokemon) { FactoryBot.create(:pokemon) }

  describe "validations" do
    it "is valid with a name and element" do
      expect(pokemon).to be_valid
    end

    it "is not valid without a name" do
      pokemon = FactoryBot.build(:pokemon, element: "Fire", name: nil)
      expect(pokemon).to_not be_valid
    end

    it "is not valid without an element" do
      pokemon = FactoryBot.build(:pokemon, name: "Charizard", element: nil)
      expect(pokemon).to_not be_valid
    end
  end

  describe "associations" do
    it "has many character_pokemons" do
      association = described_class.reflect_on_association(:character_pokemons)
      expect(association.macro).to eq(:has_many)
    end

    it "has many captured_by_characters through character_pokemons" do
      association = described_class.reflect_on_association(:captured_by_characters)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:character_pokemons)
      expect(association.options[:source]).to eq(:character)
    end
  end
end