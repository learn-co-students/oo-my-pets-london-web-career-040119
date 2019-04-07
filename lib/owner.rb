require 'pry'
require_relative '../lib/fish.rb'
require_relative '../lib/cat.rb'
require_relative '../lib/dog.rb'

class Owner

  attr_accessor :all, :pets, :name
  attr_reader :species

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @species = "human"
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.count
    @@all.length
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].each {|pet| pet.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each {|pet| pet.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each {|pet| pet.mood = "happy"}
  end

  def sell_pets
    @pets.each do |animals, pets|
      pets.each {|pet| pet.mood = "nervous"}
    end
    @pets = []
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end

end
