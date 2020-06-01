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

    #Return the ingredient instance 
    #that the highest number of users are allergic to
    def self.most_common_allergy
        self.all.max_by do |ingre|
            Allergy.all.select {|allergy| allergy.ingredient == ingre}.count
        end
    end
end