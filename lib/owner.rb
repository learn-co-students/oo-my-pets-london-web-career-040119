class Owner
  attr_reader :species
  attr_accessor :pets, :name

  @@all = []

  def initialize(species)
    @species = species
    @@all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def buy_fish(name)
    pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    pets[:dogs] << Dog.new(name)
  end

  def say_species
    "I am a #{self.species}."
  end

  def name=(name)
    @name = name
  end

  def walk_dogs
    pets[:dogs].map { |dog| dog.mood = "happy" }
  end

  def play_with_cats
    pets[:cats].map { |cat| cat.mood = "happy" }
  end

  def feed_fish
    pets[:fishes].map { |fish| fish.mood = "happy" }
  end

  def sell_pets
    pets.map do |key, value|
      value.map do |pet|
        pet.mood = "nervous"
      end
    end
    pets.clear
  end

  def list_pets
    "I have #{pets[:fishes].length} fish, #{pets[:dogs].length} dog(s), and #{pets[:cats].length} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end
end
