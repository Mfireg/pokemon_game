class Pokemon < ApplicationRecord
  has_many :character_pokemons
  has_many :captured_by_characters, through: :character_pokemons, source: :character

end
