class RecipeCard


    attr_accessor :date, :user, :rating, :recipe
    @@all = []
    def initialize(attributes)
        @date = attributes[date]
        @user = attributes[user]
        @rating = attributes[rating]
        @recipe  = attributes[recipe]

        @@all << self
    end

    def self.all
        @@all
    end
end
