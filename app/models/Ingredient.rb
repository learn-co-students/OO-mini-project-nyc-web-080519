class Ingredient

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def my_allergies
        Allergy.all.select do |allergy|
            allergy.ingredient == self
        end
    end

    def self.most_common_allergen
        self.all.max_by do |ingredient|
            ingredient.my_allergies.count
        end
    end

end
