class RecipeCard
  @@all = []
 
  attr_accessor :user, :recipe, :date, :rating 

  def initialize(user, recipe, date, rating)
    @user = user
    @recipe = recipe 
    @date = date
    @rating = rating
    @@all << self
  end  # ends initialize method

  def self.all
    @@all
  end  # ends self.all method

end  # ends RecipeCard class