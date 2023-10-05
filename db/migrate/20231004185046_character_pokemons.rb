class CharacterPokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :character_pokemons do |t|
      t.references :character, null: false, foreign_key: true
      t.references :pokemon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
