require "pry"

class Cat
  # code goes here
  attr_accessor :owner,:mood
  attr_reader :name

  @@all = []

  def initialize(name,owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  #def self.this_cat(cat)
  #  @@all.find {|this_one_cat| this_one_cat.name == cat }
  #end

end