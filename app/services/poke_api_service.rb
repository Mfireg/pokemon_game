class PokeApiService
    include HTTParty
    base_uri 'https://pokeapi.co/api/v2'
  
    def initialize; end
  
    def get_pokemon_data(pokemon_id)
      response = self.class.get("/pokemon/#{pokemon_id}")
      handle_response(response)
    end
  
    private
  
    def handle_response(response)
      if response.success?
        response.parsed_response
      else
        raise "HTTParty request failed with code #{response.code}: #{response.body}"
      end
    end
  end