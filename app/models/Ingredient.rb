class Ingredient

    @@all = []

    def initialize(allergen)
        @allergen = allergen
        @@all << self 
    end


    def self.all
        @@all
    end

    def self.most_common_allergen
        h = Hash.new(0)
        Allergy.all.each {|allergy| h[allergy]+= 1}
        h.max_by{|k,v| v}
    end
end
