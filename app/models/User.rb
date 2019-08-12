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

    def recipes
        RecipeCard.all.select {|recipe_card| recipe_card.user == self}
    end

    def add_recipe_card(given_recipe, given_date, given_rating)
        RecipeCard.new(self, given_recipe, given_date, given_rating)
    end

    def declare_allergy(given_ingredient)
        Allergy.new(self, given_ingredient)
    end

    def allergens
        Allergy.all.select {|allergy| allergy.user == self}
    end

    #top 3 ratings for this user from the recipe card
    def top_three_recipes
        ratings = Hash.new(0)
        recipes.each { |recipe| ratings[recipe.recipe.name] = recipe.rating }
        sorted_ratings = ratings.sort_by { |k, v| v }
        [sorted_ratings[-1][0], sorted_ratings[-2][0], sorted_ratings[-3][0]]
    end

    def most_recent_recipe
        recipes.last.recipe
    end

    #should return all recipes that do not contain ingredients the user is allergic to
    def safe_recipes
        recipes.reject do |recipe|
            recipe.ingredients.any? {|ingredient| allergens.include?(ingredient)}
        end
    end
end