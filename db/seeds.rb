# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

puts "Removing old ingredients..."
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

json = JSON.parse(open(url).read)

array = json["drinks"]

ingredients = []

array.each do |e|
  ingredients << e["strIngredient1"]
end

puts "Adding new ingredients..."

ingredients.each do |ingredient|
  new_ingredient = Ingredient.create!(name: ingredient)
  puts "Creating ingredient with id #{new_ingredient.id}"
end

puts "Finished!"
