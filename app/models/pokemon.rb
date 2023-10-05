class Pokemon < ApplicationRecord
  has_many :character_pokemons
  has_many :captured_by_characters, through: :character_pokemons, source: :character

  validates :name, presence: :true
  validates :element, presence: :true
end
