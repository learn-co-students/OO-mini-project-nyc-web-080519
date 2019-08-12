require_relative '../config/environment.rb'


u1 = User.new
u2 = User.new
u3 = User.new
u4 = User.new

r1 = Recipe.new
r2 = Recipe.new
r3 = Recipe.new
r4 = Recipe.new

rc1 = RecipeCard.new(u1, r1, '2019--01--01', 10)
rc2 = RecipeCard.new(u2, r1, '2009-10-04', 2)
rc3 = RecipeCard.new(u3, r2, '2000-02-04', 4)
rc4 = RecipeCard.new(u4, r3, '2003-02-04', 8)
rc5 = RecipeCard.new(u1, r3, '2000-05-04', 8)
rc6 = RecipeCard.new(u1, r2, '2000-05-04', 3)
rc7 = RecipeCard.new(u1, r4, '2000-05-04', 2)

i1 = Ingredient.new
i2 = Ingredient.new
i3 = Ingredient.new
i4 = Ingredient.new
i5 = Ingredient.new

ri1 = RecipeIngredient.new(r1, i1)
ri2 = RecipeIngredient.new(r1, i2)
ri3 = RecipeIngredient.new(r1, i3)
ri4 = RecipeIngredient.new(r2, i1)
ri5 = RecipeIngredient.new(r3, i3)

a1 = Allergy.new(u1, i1)
a2 = Allergy.new(u1, i2)
a3 = Allergy.new(u2, i1)
a4 = Allergy.new(u3, i4)

binding.pry
