class MapController < ApplicationController
    def index
        @character = Character.new
    end

    def walk
      @character = Character.find(params[:character_id])
      pokemon_appeared = @character.get_into_grass
      if pokemon_appeared == "Nothing is here"
        render template: "map/index"
      else
        redirect_to battle_path(pokemon: pokemon_appeared), notice: "A Pokemon has appeared."
      end
    end
    

    def battle
      @pokemon = params[:pokemon]
    end

    private

    def map_params
      params.require(:map).permit(:character_id, :pokemon_id, :pokemon_name, :pokemon_type)
    end
end
