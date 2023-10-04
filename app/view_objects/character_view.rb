class CharacterView
    attr_reader :character

    def initialize(character)
      @character = character
    end

    def display_name
        @character.name.capitalize
    end

    def display_age
        @character.age
    end

    def display_gender
        @character.gender
    end
end