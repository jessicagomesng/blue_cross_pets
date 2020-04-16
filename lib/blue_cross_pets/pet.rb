class BlueCrossPets::Pet

  attr_accessor :name, :breed, :gender, :age, :availability, :profile_url, :bio, :breed_and_colour, :can_live_with, :reference

  @@all = []

  def initialize(pet_hash)
    pet_hash.each do |attribute, value|
      self.send("#{attribute}=".to_sym, value)
    end

    @@all << self
  end

  def self.create_from_index(pet_array)
    pet_array.each do |pet_hash|
      self.new(pet_hash) #see if animal exists
    end
  end

  def add_attributes(attribute_hash)
    attribute_hash.each do |attribute, value|
      self.send("#{attribute}=".to_sym, value)
    end
    self
  end

  def self.all
    @@all
  end

  def self.list_all
    self.all.each_with_index do |animal, index|
      puts "#{index + 1}. #{animal.name} - #{animal.breed} - #{animal.gender} - #{animal.age} - availability(update)"
    end
  end

  def self.get_more_info(input)
    #reference the input-1 object in your all array
    index = input.to_i - 1
    animal = all[index]

    if !animal.bio
      attribute_hash = BlueCrossPets::Scraper.scrape_profile(animal.profile_url)
      animal.add_attributes(attribute_hash)
    elsif animal.bio
    end 
    #elsif animal.bio
    puts "All about #{animal.name}!"
    puts "Age: #{animal.age}"
    puts "Gender: #{animal.gender}"
    puts "Breed & colour: #{animal.breed_and_colour}"
    puts "Can live with: #{animal.can_live_with}"
    puts "Bio: #{animal.bio}"
    puts "Animal reference number: #{animal.reference}"
    puts "Visit my page: #{animal.profile_url}"
    #:breed, :gender, :age, :availability, :profile_url, :bio, :breed_and_colour, :can_live_with, :reference
    #get attributes for that dog
    #if the dog's bio already exists then just return the dog instance
    #otherwise, fetch the data, then return the dog instance.
    #end
  end

  def self.test
    puts "test in progress"
  end

end
