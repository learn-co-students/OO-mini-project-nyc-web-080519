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
    recipe_hash = Hash.new(0)
    # recipes = RecipeCard.all.collect do |recipe|
    #   recipe.recipe
    # end
    # r_hash = recipes.each do |recipe|
    #   recipe_hash[recipe] += 1 
    # end
    # output = r_hash.sort_by {|recipe, count| count}
    # output.last
    # #recipe_hash = Hash.new(0)
    RecipeCard.all.collect { |recipe| recipe.recipe}.each { |recipe| recipe_hash[recipe] += 1 }.sort_by {|recipe, count| count}.last
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