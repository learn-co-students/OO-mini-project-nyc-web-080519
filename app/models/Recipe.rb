class Recipe

  @@all = []

  attr_accessor :name, :ingredients_arr

  def initialize(name, ingredients_arr)
    @name = name
    @ingredients_arr = ingredients_arr
    @@all << self
  end  #ends initialize method


  def self.all
    @@all
  end  # ends self.all method

  def self.most_popular
    #grab all the recipes
    #go through and compare recipes with the recipe cards 
    #count the number 
    self.all.max_by |recipe| 
      #this bottom loop returns an array to run max_by through
      RecipeCard.all.select do |card|
        card.recipe == recipe
      end.count #count the results and max_by will spit out the max 
    end
  end  # ends self.most_popular

  def my_recipes
    RecipeCard.all.select {|recipe| recipe.recipe == self}
  end
  
  def users
    my_recipes.collect{|recipe| recipe.user}
  end

  def ingredients
    self.ingredients_arr
  end

  def allergens
    all_alls = Allergy.all.collect { |allergen| allergen.ingredient }.uniq 
    recip_ing = self.ingredients_arr
    all_alls & recip_ing
  end


end  # ends Recipe class