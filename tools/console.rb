require_relative '../config/environment.rb'


u1 = User.new("Sumaiya")
u2 = User.new("Dan")

r1 = Recipe.new("Spaghetti")
r2 = Recipe.new("Fried Chicken")

i1 = Ingredient.new("Pepper")
i2 = Ingredient.new("Onion")
i3 = Ingredient.new("Ground Beef")

rc1 = RecipeCard.new(u1, r1)
rc2 = RecipeCard.new(u2, r2)
rc3 = RecipeCard.new(u1, r2)

ri1 = RecipeIngredient.new(r1, i3)
ri2 = RecipeIngredient.new(r2, i2)
ri3 = RecipeIngredient.new(r1, i1)

#a1 = Allergy.new()




binding.pry
