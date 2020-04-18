require_relative "./lib/blue_cross_pets/pet"

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

  def self.list_all
    self.all.each_with_index do |dog, index|
      puts "#{index + 1}. ".blue + "#{dog.name} - #{dog.breed} - #{dog.gender} - #{dog.age} - #{dog.availability}"
    end
  end

  def self.scrape_dogs

    if all.length == 0
      dog_array = BlueCrossPets::Scraper.scrape_index("https://www.bluecross.org.uk/rehome/dog")
      create_from_index(dog_array)
      list_all
    elsif all.length > 0
      list_all
    end

  end

  def self.get_more_info(input)

    index = input.to_i - 1
    dog = all[index]

    if !dog.reference
      attribute_hash = BlueCrossPets::Scraper.scrape_profile(dog.profile_url)
      dog.add_attributes(attribute_hash)
    elsif dog.reference
    end

    puts "----------------------------- All about #{dog.name} -----------------------------".blue
    puts "Age: ".light_white + "#{dog.age}"
    puts "Gender: ".light_white + "#{dog.gender}"
    puts "Availability: ".light_white + "#{dog.availability}"
    puts "Breed & colour: ".light_white + "#{dog.breed_and_colour}"

    if dog.can_live_with
      puts "Can live with: ".light_white + "#{dog.can_live_with}"
    end

    puts "Bio: ".light_white + "#{dog.bio}"
    puts "Animal reference number: ".light_white + "#{dog.reference}"
    puts "Visit my page: ".light_white + "#{dog.profile_url}"
  end

end
