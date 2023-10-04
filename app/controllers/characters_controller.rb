class CharactersController < ApplicationController
    def index; end

    def new
        @character = Character.new
    end

    def create
        @character = Character.new(character_params)

        if @character.save
            redirect_to @character, notice: 'Character successfuly created.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        character = Character.find(params[:id])
        @character_view = CharacterView.new(character)
    end

    private

    def character_params
        params.require(:character).permit %i[name age gender]
    end
end
