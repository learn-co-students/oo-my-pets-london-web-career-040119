class Owner
  attr_accessor :name, :pets
  attr_reader :species

  @@all = []

  def initialize(species)
    @species = species
    @@all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    "I am a #{species}."
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

  def walk_dogs
    pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets #My solution
    pets[:fishes].each {|fish| fish.mood = "nervous"}
    pets[:cats].each {|cat| cat.mood = "nervous"}
    pets[:dogs].each {|dog| dog.mood = "nervous"}
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end
  #There solution (better, less code smell)
  # def sell_pets
  # pets.each do |species, animals|
  #   animals.each do |animal|
  #     animal.mood = "nervous"
  #   end
  #   animals.clear
  #   end
  # end

  #Made an improved solution which correctly changes dog(s) and cat(s) to what
  #They actually should be, based on what they are. I.e 0 cat = cats, 1 cat = cat
  # > 1 cat = cats
  def list_pets
    # if @pets[:cats].size == 1
    #   @catplural = ""
    # else
    #   @catplural = "'s"
    # end
    # if @pets[:dogs].size == 1
    #   @dogplural = ""
    # else
    #   @dogplural = "'s"
    # end
    # "I have #{pets[:fishes].size} fish, #{pets[:dogs].size} dog#{@dogplural}, and #{pets[:cats].size} cat#{@catplural}."
    "I have #{pets[:fishes].size} fish, #{pets[:dogs].size} dog(s), and #{pets[:cats].size} cat(s)."
  end
end
