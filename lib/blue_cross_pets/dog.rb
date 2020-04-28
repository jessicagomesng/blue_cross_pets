#require_relative "./pet"

class BlueCrossPets::Dog < BlueCrossPets::Pet

  @@dogs = []

  def initialize(pet_hash)
    pet_hash.each do |attribute, value|
      self.send("#{attribute}=".to_sym, value)
    end

    @@dogs << self
  end

  def self.all
    @@dogs
  end

  def self.sorted_array
    self.all.sort { |dog1, dog2| dog1.name <=> dog2.name }
  end 

  def self.create_dogs
    if all.length == 0
      dog_array = BlueCrossPets::Scraper.new.scrape_index("https://www.bluecross.org.uk/rehome/dog")
      create_from_index(dog_array)
    end
  end

end
