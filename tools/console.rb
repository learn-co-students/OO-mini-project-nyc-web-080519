require_relative '../config/environment.rb'

# ADD USERS
rick = User.new("Rick")
morty = User.new("Morty")
hank = User.new("Hank")
bobby = User.new("Bobby")

# ADD INGREDIENTS
milk = Ingredient.new("Milk")
oats = Ingredient.new("Oats")
cheese = Ingredient.new("Cheese")
beef = Ingredient.new("Beef")
chocolate = Ingredient.new("Chocolate")
bread = Ingredient.new("Bread")
sugar = Ingredient.new("Sugar")
salt = Ingredient.new("Salt")
pepper = Ingredient.new("Pepper")
pasta = Ingredient.new("Pasta")
butter = Ingredient.new("Butter")

# ADD RECIPES  -----NEEDS WORK ingr
cookies = Recipe.new("cookies", [sugar, chocolate, milk, oats, butter])
mac_cheese = Recipe.new("Mac and Cheese", [pasta, cheese, salt, butter])
oatmeal = Recipe.new("oatmeal", [oats, milk, sugar, chocolate])
burger = Recipe.new("Burger", [beef, cheese, bread, salt, pepper ])

# ADD RECIPE CARDS
rc1 = RecipeCard.new(rick, cookies, "2019-08-12", 7)
rc2 = RecipeCard.new(morty, mac_cheese, "2019-07-10", 2)
rc5 = RecipeCard.new(bobby, mac_cheese, "2019-07-10", 4)
rc3 = RecipeCard.new(hank, burger, "2015-08-12", 9)
rc4 = RecipeCard.new(bobby, oatmeal, "2012-02-02", 5)
rc8 = RecipeCard.new(bobby, burger, "2019-02-02", 9)
rc9 = RecipeCard.new(bobby, cookies, "2019-02-02", 7)
rc6 = RecipeCard.new(rick, oatmeal, "2001-02-02", 10)
rc7 = RecipeCard.new(morty, oatmeal, "2001-02-02", 10)

#ADD ALLERGY
a1 = Allergy.new(rick, chocolate)
a2 = Allergy.new(bobby, cheese)
a3 = Allergy.new(hank, chocolate)
a4 = Allergy.new(morty, beef)
a5 = Allergy.new(bobby, beef)
a6 = Allergy.new(hank, beef)

binding.pry
