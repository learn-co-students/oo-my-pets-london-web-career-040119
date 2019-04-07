class Owner
  OWNERS = [] # in caps makes it a constant
  attr_accessor :name, :pets # will have a name /
  attr_reader :species # cant changed species

  def self.reset_all # ::reset_all can reset the owners that have been created
    OWNERS.clear
  end

  def self.all # ::all returns all instances of Owner that have been created
    OWNERS # will return the class constant owners
  end

  def self.count # ::count returns the number of owners that have been created
    OWNERS.size # using the .size method that tells us how many items in the array
  end

  def initialize(species) # initializes with a species
    @species = species
    OWNERS << self
    @pets = {:fishes => [], :dogs => [], :cats => []} # is initialized with a pets attribute as a hash with 3 keys
  end

  def buy_fish(name) # can buy a fish that is an instance of the Fish class
    pets[:fishes] << Fish.new(name) # pushing the names from fish class into the fishes value in the pets hash
  end

  def buy_dog(name) #  can buy a dog that is an instance of the Dog class
    pets[:dogs] << Dog.new(name) # pushing the names from Dogs class into the dogs value in the pets has
  end

  def buy_cat(name) # can buy a cat that is an instance of the Cat class
    pets[:cats] << Cat.new(name) # pushing the names from Cats class into the cats value in the pets hash
  end

  def walk_dogs #  walks the dogs which makes the dogs' moods happy
    pets[:dogs].each do |dog| # enters the pets hash and selects the dog key then used .each to iterage over each dog value
      dog.mood = "happy" # then change each dog mood set to happy
    end
  end

  def play_with_cats # same as dog walk
    pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish # same as dog walk
    pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets # can sell all its pets, which make them nervous
    pets.each do |species, animals| # goes in the pets hash sets key = species and value = animals
      animals.each do |animal| # iterates thought the values animals
        animal.mood = "nervous" # and changes their mood to nervous
      end
      animals.clear # then values are cleared
    end
  end

  def say_species # print what species it is
    "I am a #{species}."
  end

  def list_pets # list of the pets 
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end

end
