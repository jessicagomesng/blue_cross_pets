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

  def self.all
    @@all
  end

  def self.list_all
    self.all.each_with_index do |animal, index|
      puts "#{index + 1}. #{animal.name} - #{animal.breed} - #{animal.gender} - #{animal.age} - availability(update)"
    end
  end

  def self.test
    puts "test in progress"
  end

end
