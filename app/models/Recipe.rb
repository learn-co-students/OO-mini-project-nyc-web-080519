class Recipe

    @@all = []
    attr_reader :ingredients
    
    # def initialize(ingredients)
    #     @ingredients = ingredients
    # end

    def add_ingredients(ingredients)
        @ingredients << ingredients
    end

    def self.all
        @@all
    end

    def self.most_popular
        #go through recipie and count how many cards each recipe has and pick the best 
        h = Hash.new(0)
        self.all.each {|recipe| h[recipe] += 1}
        h.max_by{|k, v| v}
    end

    def users
        RecipeCard.all.select { |r_c| r_c.user == self }
    end

    def allergens
        a = []
        users.select {|user|a << user.allergies}
        a.select{|allergy| recipe.ingredients.include?(allergy.ingredient)}
    end
end