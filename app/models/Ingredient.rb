class Ingredient
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end
    
    def self.all
        @@all
    end

    def self.most_common_allergy
        allergy_hash = Hash.new(0)
        Allergy.all.each { |allergy| allergy_hash[allergy.ingredient.name] += 1 }
        allergy_hash.max_by { |k, v| v }[0]
    end

    def allergies
        Allergy.all.select {|allergy| allergy.ingredient == self}
    end
end