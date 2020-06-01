require_relative '../config/environment.rb'

kunxi = User.new("Kunxi")
dan = User.new("Dan")
bob = User.new("Bob")

burger_recipe = Recipe.new("burger")
salad_recipe = Recipe.new("salad")
fries_recipe = Recipe.new("fries")
soda_recipe = Recipe.new("soda")
sandwich_recipe = Recipe.new("sandwich")

burger1 = RecipeCard.new(kunxi, burger_recipe, "3/2/2019", 5)
burger2 = RecipeCard.new(dan, burger_recipe, "3/7/2019", 3)
salad = RecipeCard.new(dan, salad_recipe, "5/4/2019", 1)
fries = RecipeCard.new(kunxi, fries_recipe, "1/5/2019", 5)
soda = RecipeCard.new(kunxi, soda_recipe, "2/2/2019", 2)
sandwich = RecipeCard.new(kunxi, sandwich_recipe, "2/10/2019", 3)

lettuce = Ingredient.new("lettuce")
tomato = Ingredient.new("tomato")
red_meat = Ingredient.new("red meat")
flour = Ingredient.new("flour")
potato = Ingredient.new("potato")

lettuce_allergy = Allergy.new(kunxi, lettuce)
lettuce_allergy1 = Allergy.new(dan, lettuce)
lettuce_allergy2 = Allergy.new(bob, flour)
lettuce_allergy3 = Allergy.new(kunxi, tomato)

RecipeIngredient.new(burger_recipe, lettuce)
RecipeIngredient.new(burger_recipe, flour)
RecipeIngredient.new(burger_recipe, red_meat)
RecipeIngredient.new(sandwich_recipe, red_meat)

binding.pry
