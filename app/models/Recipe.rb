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

    def recipes
        RecipeCard.all.select { |recipe_card| recipe_card.recipe == self }
    end

    def self.most_popular
        self.all.max_by {|recipe| recipe.recipes.count} 
    end

    #should return the user instances who have recipe cards with this recipe
    def users
        recipes.map do |recipe|
            recipe.user
        end
    end

    # should return all of the ingredients in this recipe
    def ingredients
        ingre_list = RecipeIngredient.all.select do |recipe_ingr|
            recipe_ingr.recipe.recipe == self
        end
        ingre_list.map {|recipe| recipe.ingredient}

        # RecipeIngredient.all.select { |rec_ing| rec_ing.recipe == self }.map { |recipe| recipe.ingredient }
    end

    def allergens
        ingredients.select do |ingredient|
            Allergy.all.map do |allergy|
                allergy.ingredient
            end.uniq.include?(ingredient)
        end
    end

    def add_ingredients(ingre)
        ingre.each do |ingre|
            RecipeIngredient.new(self, ingre)
        end
    end
end