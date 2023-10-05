class CharactersController < ApplicationController
    protect_from_forgery with: :exception

    include Capture

    def index; end

    def new
        @character = Character.new
    end

    def create
        @character = Character.new(character_params)

        if @character.save
            redirect_to @character, notice: 'Character succesfully created.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        character = Character.find(params[:id])
        @character_view = CharacterView.new(character)
    end

    def throw_pokeball
        @character = Character.find(params[:id])
        @pokemon = Pokemon.find_or_create_by(id: params[:pokemon_id], name: params[:pokemon_name], element: params[:pokemon_element])
        captured = @character.capture_pokemon(@character, @pokemon)
    
        render json: captured
      end

    private

    def character_params
        params.require(:character).permit %i[name age gender]
    end
end
