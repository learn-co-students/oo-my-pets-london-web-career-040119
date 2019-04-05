require 'pry'

class Owner
  attr_reader :species
  attr_accessor :name, :pets
  @@all = []

  def initialize(name)
    @name = name
    @species = 'human'
    @pets = {
      fishes: [],
      cats: [],
      dogs: []
    }
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
    "I am a #{species}."
  end

  def buy_fish(fishName)
    @pets[:fishes] << Fish.new(fishName)
  end

  def buy_cat(catName)
    @pets[:cats] << Cat.new(catName)
  end

  def buy_dog(dogName)
    @pets[:dogs] << Dog.new(dogName)
  end

  def walk_dogs
    @pets[:dogs].each { |dog| dog.mood = 'happy' }
  end

  def play_with_cats
    @pets[:cats].each { |cat| cat.mood = 'happy' }
  end

  def feed_fish
    @pets[:fishes].each { |fish| fish.mood = 'happy' }
  end

  def sell_pets
    @pets.values.flatten.each { |pet| pet.mood = 'nervous' }
    @pets.clear
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end
end
