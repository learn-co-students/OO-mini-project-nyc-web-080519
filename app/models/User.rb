class User
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    #returns all recipe cards for this user
    def recipe_cards
        RecipeCard.all.select {|recipe_card| recipe_card.user == self}
    end    

    #return all of the recipes this user has recipe cards for
    def recipes
        self.recipe_cards.map {|recipe_card| recipe_card.recipe}
    end

    #accept a recipe instance, a date and rating, as arguments 
    #and create a new recipe card for this user and the given recipe
    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(self, recipe, date, rating)
    end

    #accept an Ingredient instance as an argument
    #create a new Allergy instance for this User and the given Ingredient
    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end

    #return all of the ingredients this user is allergic to
    def allergens
        Allergy.all.select {|allergy| allergy.user == self}.map {|allergy| allergy.ingredient}
    end

    #top 3 rated recipes for this user from the recipe card
    def top_three_recipes
        recipe_cards.sort_by do |recipe_card| 
            recipe_card.rating
        end.reverse.first(3).map {|recipe_card| recipe_card.recipe}
    end

    #return the recipe most recently added to the user's cookbook.
    def most_recent_recipe
        recipe_cards.last.recipe
    end

    #should return all recipes that do not contain ingredients the user is allergic to
    #reject recipes that contain ingredients this user is allergic too
    def safe_recipes
        self.recipes.reject do |recipe|
            recipe.ingredients.any? {|ingre| self.allergens.include?(ingre)}
        end
    end
end