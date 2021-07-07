class User

    attr_accessor :recipe_cards

    @@all = []
    def initialize(recipe_cards, allergies)
        @recipe_cards = recipe_cards
        @allergies = allergies
        @@all << self
    end

    def self.all
        @@all
    end

    def recipes
        recipe_cards.select { |r_c| r_c.recipe }
    end

    def add_recipe_card(attributes) #date, recipe, rating
        recipe_cards << RecipeCard.new(user: self, recipe: attributes[recipe],date: attributes[date],rating: attributes[rating])
    end

    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end

    def allergens
        self.allergies
    end

    def top_three_recipies
        h = Hash.new(0)
        self.recipe_cards.each {|r_c| h[r_c] += 1}
        h.sort_by{|k,v| v}[0..2]
    end

    def most_recent_recipe
        self.recipe_cards[-1]
    end

end
