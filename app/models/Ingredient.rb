class Ingredient
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def my_allergies
        Allergy.all.select do |allergy|
            allergy.ingredient == self
        end
    end

    def self.all
        @@all
    end

    def recipeIngredients
        RecipeIngredient.all.select do |recipeIngredient|
            recipeIngredient.ingredient == self
        end
    end

    def recipes
        recipeIngredients.map do |recipeIngredient|
            recipeIngredient.recipe
        end
    end

    def self.most_common_allergen
        counter = 0
        most_common_ingredient = nil
        all.each do |ingredient|
            if counter < ingredient.my_allergies.count
                counter = ingredient.my_allergies.count
                most_common_ingredient = ingredient
            end
        end
        return most_common_ingredient
    end

end

