module Capture
  def capture_pokemon(character, pokemon)
    random_number = rand(1..3)

    if random_number == 1
      CharacterPokemon.create(character: character, pokemon: pokemon)
      true
    else
      false
    end
  end
end