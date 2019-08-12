class Recipe
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def my_recipe_cards
        RecipeCard.all.select do |recipeCard|
            recipeCard.recipe == self
        end
    end

    def my_recipeIngredients
        RecipeIngredient.all.select do |recipeIngredient|
            recipeIngredient.recipe == self
        end
    end

    # def my_allergies
    #     Allergy.all.select do |allergy|
    #         allergy.recipe == self
    #     end
    # end

    def users
        my_recipe_cards.map do |recipeCard|
            recipeCard.user
        end
    end

    def ingredients
        my_recipeIngredients.map do |recipeIngredient|
            recipeIngredient.ingredient
        end
    end

    # def allergens
    #     ingredients.select do |ingredient|
    #         Allergy.all.
    #     end
    # end

    def add_ingredients(ingredients_arr)
        ingredients_arr.each do |ingredient|
            RecipeIngredient.new(self, ingredient)
        end
    end

    def self.most_popular
        highest_number = 0
        most_popular_recipe = ""
        all.each do |recipe|
           if  recipe.users.count > highest_number
            highest_number = recipe.users.count
            most_popular_recipe = recipe
           end
        end
        return most_popular_recipe
    end

end #end of Recipe class