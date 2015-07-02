# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Pokemon.destroy_all

pokemon_data = HTTParty.get("https://www.kimonolabs.com/api/74dfm89w?apikey=Zgn83shuWLFhlB7k5n4arKz3Z18Z5lvr")

pokemons = pokemon_data["results"]["collection1"]

pokemons.each do |pokemon|
  new_poke = Pokemon.new({
    ndex: pokemon["nDex"],
    name: pokemon["name"]["text"],
    kind: pokemon["type"]["text"],
    photo_url: pokemon["image"]["src"]
  })
end