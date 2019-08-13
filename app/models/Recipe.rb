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

    #Return RecipeCards that use this recipe
    def recipe_cards
        RecipeCard.all.select {|recipe_card| recipe_card.recipe == self}
    end

    #Return the recipe instance with the highest number of users
    def self.most_popular
        Recipe.all.max_by {|recipe| recipe.recipe_cards.count}
    end

    #Return the user instances who have recipe cards with this recipe
    def users
        self.recipe_cards.map {|recipe_card| recipe_card.user}
    end

    #Return all of the ingredients in this recipe
    def ingredients
        RecipeIngredient.all.select do |recipe_ingre|
            recipe_ingre.recipe == self
        end.map {|recipe_ingre| recipe_ingre.ingredient}
    end

    #Return all of the Ingredients in this recipe 
    #that are allergens for Users in our system
    def allergens
        self.ingredients.select do |ingre|
            Allergy.all.map {|allergy| allergy.ingredient}.uniq.include?(ingre)
        end
    end

    #Take an array of ingredient instances as an argument
    #associate each of those ingredients with this recipe
    def add_ingredients(ingre)
        ingre.each {|ingre| RecipeIngredient.new(self, ingre)}
    end
end