class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :n_dex
      t.string :name
      t.string :type
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
