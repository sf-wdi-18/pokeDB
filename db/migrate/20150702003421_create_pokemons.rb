class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :ndex
      t.string :name
      t.string :kind
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
