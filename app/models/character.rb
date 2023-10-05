class Character < ApplicationRecord
    include Capture

    has_many :character_pokemons
    has_many :captured_pokemons, through: :character_pokemons, source: :pokemon  

    validates :name, presence: true, length: { minimum: 2 }
    validates :age, numericality: { less_than_or_equal_to: 16, message: "must be less or equal to 16." }
    validates :gender, inclusion: { in: %w(male female), message: "must be 'male' or 'female'" }

    def get_into_grass
        return "Nothing is here" unless grass_has_a_pokemon?

        pokemon_appeared = Random.rand(1..150)
        poke_api_service = PokeApiService.new
        @pokemon_data = poke_api_service.get_pokemon_data(pokemon_appeared) # TODO change the pokemon data for something else
    end

    def grass_has_a_pokemon?
        rand(2).zero?
    end
end
