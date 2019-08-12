require_relative '../config/environment.rb'


u1 = User.new("Sumaiya")
u2 = User.new("Dan")
u3 = User.new("April")
u4 = User.new("Ashley")

r1 = Recipe.new("Spaghetti")
r2 = Recipe.new("Fried Chicken")
r3 = Recipe.new("Sponge Cake")
r4 = Recipe.new("Won Ton Soup")
r5 = Recipe.new("Steak")

i1 = Ingredient.new("Pepper")
i2 = Ingredient.new("Onion")
i3 = Ingredient.new("Ground Beef")
i4 = Ingredient.new("Cumin")
i5 = Ingredient.new("Eggplant")
i6 = Ingredient.new("Chicken")
i7 = Ingredient.new("Ribeye")

rc1 = RecipeCard.new(u1, r1, "1999", "3")
rc2 = RecipeCard.new(u2, r1, "2005", "1")
rc3 = RecipeCard.new(u3, r2, "1777", "2")
rc4 = RecipeCard.new(u1, r4, "1999", "4")
rc5 = RecipeCard.new(u4, r1, "2005", "3")
rc6 = RecipeCard.new(u2, r2, "1777", "5")
rc7 = RecipeCard.new(u1, r1, "1999", "5")
rc8 = RecipeCard.new(u2, r2, "2005", "4")
rc9 = RecipeCard.new(u3, r2, "1777", "5")
rc10 = RecipeCard.new(u4, r2, "2005", "4")
rc11 = RecipeCard.new(u1, r2, "1777", "5")
rc12 = RecipeCard.new(u4, r4, "1999", "5")
rc13 = RecipeCard.new(u2, r2, "2005", "4")
rc14 = RecipeCard.new(u3, r2, "1777", "5")
rc15 = RecipeCard.new(u1, r5, "1999", "5")

ri1 = RecipeIngredient.new(r1, i3)
ri2 = RecipeIngredient.new(r2, i2)
ri3 = RecipeIngredient.new(r1, i1)

a1 = Allergy.new(u1, i1)
a2 = Allergy.new(u2, i1)
a3 = Allergy.new(u1, i2)
a3 = Allergy.new(u1, i2)
a3 = Allergy.new(u1, i2)
a3 = Allergy.new(u1, i2)





binding.pry
