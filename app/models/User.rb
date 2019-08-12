class User

  @@all = []

  def initialize(name)
    @name = name
    @@all << self

  end  # ends initialize method

  def recipes
    RecipeCards.all.select { |recipe| recipe.user == self }
  end  #ends user_recipe method

  def add_recipe_card(recipe)
    RecipeCard.new(self, recipe, "2019-08-12", 5)
  end  #ends add_recipe_card method

  def self.all
    @@all
  end  # ends self.all method

  def declare_allergy(ingredient)
    Allergy.new(self, ingredient)
  end

  def allergens 
    Allergy.all.select {|allergy| allergy.user == self}
  end

  def top_three_recipes
    my_recipes = RecipeCard.all.select { |rc| rc.user == self}
    my_recipes.max_by(3) { |rc| rc.rating }
  end

  def most_recent_recipe
    RecipeCard.all.select { |rc| rc.user == self}.max_by { |rc| rc.date }
  end  # ends most_recent_recipe method

  def  safe_recipes
    user_allergic_to = Allergy.all.select { |al| al.user == self}
    users_rcs = RecipeCard.all.select { |rc| rc.user == self }
    output = []
    users_rcs.each do |rc|
      # binding.pry
      if (rc.recipe.ingredients_arr & user_allergic_to.collect{|al| al.ingredient}).length == 0
        output << rc.recipe
      end

    end
    output
    #binding.pry
  end  # ends safe_recipes method

end  # ends User class