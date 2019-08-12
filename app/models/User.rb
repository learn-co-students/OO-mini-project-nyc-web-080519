class User
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def recipeCards
        RecipeCard.all.select do |recipeCard|
            recipeCard.user == self
        end
    end

    def recipes
        recipeCards.map do |recipeCard|
            recipeCard.recipe
        end
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(self, recipe, date, rating)
    end

    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end

    def allergies
        Allergy.all.select do |allergy|
            allergy.user == self
        end
    end

    def allergens
        allergies.map do |allergy| #Using helper method "allergies" to iterate over its return
            allergy.ingredient
        end
    end

    def top_three_recipes
        my_arr = recipeCards.sort_by do |recipeCard|
            recipeCard.rating.to_i
        end.reverse.first(3)
        my_arr.map do |recipeCard|
            recipeCard.recipe
        end
    end

    def most_recent_recipe
        recipes.last
    end

    def safe_recipes

    end

    def self.all
        @@all
    end

end
