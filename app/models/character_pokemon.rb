class CharacterPokemon < ApplicationRecord
    belongs_to :character
    belongs_to :pokemon
  end