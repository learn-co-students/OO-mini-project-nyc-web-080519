require_relative '../config/environment.rb'

kunxi = User.new("Kunxi")
dan = User.new("Dan")
bob = User.new("Bob")

burger_recipe = Recipe.new("burger")
salad_recipe = Recipe.new("salad")
fries_recipe = Recipe.new("fries")
soda_recipe = Recipe.new("soda")

burger = RecipeCard.new(kunxi, burger_recipe, "3/2/2019", 5)
salad = RecipeCard.new(dan, salad_recipe, "5/4/2019", 1)
fries = RecipeCard.new(kunxi, fries_recipe, "1/5/2019", 5)
soda = RecipeCard.new(kunxi, soda_recipe, "2/2/2019", 2)

lettuce = Ingredient.new("lettuce")
tomato = Ingredient.new("tomato")
red_meat = Ingredient.new("red meat")
flour = Ingredient.new("flour")
potato = Ingredient.new("potato")

lettuce_allergy = Allergy.new(kunxi, lettuce)
lettuce_allergy1 = Allergy.new(dan, lettuce)
lettuce_allergy2 = Allergy.new(bob, flour)
lettuce_allergy3 = Allergy.new(kunxi, tomato)

RecipeIngredient.new(burger, lettuce)
RecipeIngredient.new(burger, flour)
RecipeIngredient.new(burger, red_meat)
RecipeIngredient.new(salad, red_meat)

binding.pry
