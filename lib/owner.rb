require 'pry'

class Owner
  attr_reader :species
  attr_accessor :name, :pets
  @@all = []

  def initialize(name)
    @name = name
    @pets = {fishes: [], cats: [], dogs: []}
    @species = "human"
    @@all << self
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

  def say_species
  "I am a #{self.species}."
  end

  def buy_cat(cat)
    @pets[:cats] << Cat.new(cat)
  end

  def buy_dog(dog)
    @pets[:dogs] << Dog.new(dog)
  end

  def buy_fish(fish)
    @pets[:fishes] << Fish.new(fish)
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets [:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets [:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.each do |species,list_pets|
      list_pets.each do |pet|
        pet.mood = "nervous"
      end
      list_pets.clear
    end
  end

  def list_pets
   "I have #{@pets[:fishes].length} fish, #{ @pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end
end
