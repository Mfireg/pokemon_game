class MapController < ApplicationController
    def index
        @character = Character.new
    end

    def walk
      @character = Character.find(params[:character_id])
      if @character.get_into_grass == "Nothing is here"
      else
        redirect_to :battle, notice: "A Pokemon has appeared."
      end
    end

    def battle; end

    private

    def map_params
        params.require(:map).permit %i[character_id]
    end
end
