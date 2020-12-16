require "pry"

class Owner
  # code goes here
  attr_accessor :cat, :dog, :pets
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @pets = []
    save
  end

  def save
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  #def buy_cat(cat)
    # binding.pry
    #this_one_cat = Cat.all.find {|that_cat| that_cat.name == cat }
    #this_one_cat.owner = self
    #@@test << this_one_cat
    # binding.pry
  #end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |dog|
      dog.mood = "happy"
    end
  end

  def pets=()
    #binding.pry
    @pets << self.dogs
    @pets << self.cats
  end


  def sell_pets
=begin     self.pets.each do |pet|
      binding.pry
      pet.owner.clear
      pet.mood="nervous"
    end
=end  
  pets = self.dogs + self.cats

  binding

  pets.each do |pet|
    pet.mood = "nervous"
    pet.owner = nil
  end

  end

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end

end