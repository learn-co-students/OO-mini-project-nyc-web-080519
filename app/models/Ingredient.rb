
class Ingredient

  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end  #ends initialize method


  def self.all
    @@all
  end  # ends self.all method

  def self.most_common_allergen
    al_ings= Allergy.all.collect { |al| al.ingredient }
    hash = Hash.new(0)
    al_ings.each { |ing| hash[ing.name] += 1 }
    al_ings.find { |ingr| ingr.name == hash.max_by { |k,v| v }[0]}
    #binding.pry
  end  # ends self.most_common_allergen

end  # ends Ingredient class