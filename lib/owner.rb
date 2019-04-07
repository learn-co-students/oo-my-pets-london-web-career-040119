require "pry"

class Owner

  attr_accessor :all, :pets
  attr_reader :species, :name

  @@all =[]

  def initialize(species)
    @pets = {fishes: [], cats: [], dogs: []}
    @name
    @species = species
    @@all.push(self)
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def say_species
    "I am a #{self.species}."
  end

  def name=(name)
    @name = name
  end

  def buy_fish(name)
    new_fish = Fish.new(name)  #make new fish instance
    @pets[:fishes].push(new_fish) #push the new instance into the @pets hash
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    @pets[:cats].push(new_cat)
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    @pets[:dogs].push(new_dog)
    # binding.pry
  end

  def walk_dogs
    @pets[:dogs][0].mood = "happy"
  end

  def play_with_cats
    @pets[:cats][0].mood = "happy"
  end

  def feed_fish
    @pets[:fishes][0].mood = "happy"
    # binding.pry
  end

  def sell_pets

    @pets.each do |species, animals|
      animals.each do |each_pet|
        each_pet.mood = "nervous"
      end
      animals.clear
    end

  end

  def list_pets
    num_fish = @pets[:fishes].length
    num_cats = @pets[:cats].length
    num_dogs = @pets[:dogs].length

    "I have #{num_fish} fish, #{num_dogs} dog(s), and #{num_cats} cat(s)."

  end



end
