class User

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    #return all recipes this user has recipe cards for
    def recipes
        my_recipe_cards = RecipeCard.all.select do |recipe_card|
            recipe_card.user == self
        end
        my_recipe_cards.map do |recipe_card|
            recipe_card.recipe
        end
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(self, recipe, date, rating)
    end

    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end

    #returns all ingredients the user is allergic too
    def allergens
        my_allergies = Allergy.all.select do |allergy|
            allergy.user == self
        end
        my_allergies.map do |allergy|
            allergy.ingredient
        end
    end

    def top_three_recipes
        my_recipe_cards = RecipeCard.all.select do |recipe_card|
            recipe_card.user == self
        end
        top_three_rc = my_recipe_cards.max(3) {|a, b| a.rating <=> b.rating}
        top_three_rc.map{|rc| rc.recipe}
    end

    def most_recent_recipe
        my_recipe_cards = RecipeCard.all.select do |recipe_card|
            recipe_card.user == self
        end
        my_recipe_cards[-1].recipe
    end

    #return all recipe instances that do not contain ingredients that the user is allergic too
    def safe_recipes
        #want all of the recipes that do not contain ingredients in allergens (array of ingredients)
        #look through all of our recipes
        my_ingredients = self.recipes.map do |recipe|
            #for each recipe, get the ingredients
            recipe.ingredients #array, map makes it an array within an array
        end.flatten.uniq
        #see if any of those ingredients are not our allergens
        my_safe_ingredients = my_ingredients.select do |ingredient|
            !(self.allergens.include?(ingredient))
        end
        #select all recipe ingredients that have our safe ingredients
        my_safe_ris = RecipeIngredient.all.select do |ri|
            my_safe_ingredients.include?(ri.ingredient)
        end
        #return the recipe
        my_safe_ris.map do |ri|
            ri.recipe
        end

    end

end