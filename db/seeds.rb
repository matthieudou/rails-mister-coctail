# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all


# create array of ingredientd
ingredients = JSON.load(open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"))
ingredients = ingredients["drinks"]
ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end

10.times do
  cocktail = Cocktail.create(name: Faker::Beer.name)
  ingredients_for_cocktail = Ingredient.all.to_a
  p '****************************'
  p ingredients_for_cocktail
  10.times do
    ingredient = ingredients_for_cocktail.sample
    Dose.create!(description: Faker::Food.ingredient, cocktail: cocktail, ingredient: ingredient)
    ingredients_for_cocktail.delete_if { |element| element == ingredient }
    p ingredients_for_cocktail.size
  end
end


