class BlueCrossPets::Pet

  attr_accessor :name, :breed, :gender, :age, :availability, :profile_url, :bio, :breed_and_colour, :can_live_with, :reference, :title

  @@all = []

  def initialize(pet_hash)
    pet_hash.each do |attribute, value|
      self.send("#{attribute}=".to_sym, value)
    end

    @@all << self
  end

  def self.create_from_index(pet_array)
    pet_array.each do |pet_hash|
      self.new(pet_hash)
    end
  end

  def add_attributes(attribute_hash)
    if self.bio
    elsif !self.bio
      attribute_hash.each do |attribute, value|
        self.send("#{attribute}=".to_sym, value)
      end
    self
    end
  end

  def self.list_all
    #should return a list of instances of available dogs
    #dogs.all.each_with_index do
    #puts "1. Peety"

    dog_1 = self.new
    dog_1.name = "Peety"
    dog_1.age = "14 years old"
    dog_1.breed = "Cavalier King Charles Spaniel"
    dog_1.gender = "male"
    dog_1.availability = "nope"
    dog_1.profile_url = "not for sale!"

    dog_2 = self.new
    dog_2.name = "Pepper"
    dog_2.age = "3 years old"
    dog_2.breed = "schnoodle"
    dog_2.gender = "female"
    dog_2.availability = "nope"
    dog_2.profile_url = "not for sale!"

    [dog_1, dog_2]
  end

  def self.all
    @@all
  end

  def self.test
    puts "test in progress"
  end

end
