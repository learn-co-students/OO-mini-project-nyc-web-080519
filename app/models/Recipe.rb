class Recipe
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    #array of all recipe cards where recipe is myself
    def my_recipe_cards
        RecipeCard.all.select do |recipecard|
            recipecard.recipe == self
        end
    end

    #returns the recipe instance with the highest number of users
    #aka the recipe instance with the most recipe-cards
    def self.most_popular
        self.all.max_by do |recipe|
            recipe.my_recipe_cards.count
        end
    end

    #returns the user instances who have recipe cards with this recipe
    def users
        my_recipe_cards.map do |recipecard|
            recipecard.user
        end
    end

    #return all of the ingredients with this recipe
    def ingredients
        my_recipe_ingredients = RecipeIngredient.all.select do |recipeingredient|
            recipeingredient.recipe == self
        end
        my_recipe_ingredients.map do |recipe_ingredient|
            recipe_ingredient.ingredient
        end.uniq
    end

    #return all ingredients in this recipe that are allergens for users
    def allergens
        allergy_for_this_recipe = Allergy.all.select do |allergy|
            ingredients.include?(allergy.ingredient)
        end
        allergy_for_this_recipe.map do |allergy|
            allergy.ingredient
        end.uniq
    end

    def add_ingredients(ingredients)
        ingredients.each do |ingredient|
            RecipeIngredient.new(self, ingredient)
        end
    end
end
