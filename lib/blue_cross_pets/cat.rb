require "./lib/blue_cross_pets/pet"

class BlueCrossPets::Cat < BlueCrossPets::Pet

  @@cats = []

  def initialize(pet_hash)
    pet_hash.each do |attribute, value|
      self.send("#{attribute}=".to_sym, value)
    end

    @@cats << self
  end

  def self.all
    @@cats
  end

  def self.list_all
    self.all.each_with_index do |animal, index|
      puts "#{index + 1}. #{animal.name} - #{animal.breed} - #{animal.gender} - #{animal.age} - #{animal.availability}"
    end
  end

  def self.scrape_cats

    if all.length == 0
      cat_array = BlueCrossPets::Scraper.scrape_index("https://www.bluecross.org.uk/rehome/cat")
      create_from_index(cat_array)
      list_all
    elsif all.length > 0
      list_all
    end

  end

  def self.get_more_info(input)

    index = input.to_i - 1
    animal = all[index]

    if !animal.breed_and_colour
      attribute_hash = BlueCrossPets::Scraper.scrape_profile(animal.profile_url)
      animal.add_attributes(attribute_hash)
    elsif animal.breed_and_colour
    end

    #reformat this
    puts "All about #{animal.name}!"
    puts "Age: #{animal.age}"
    puts "Gender: #{animal.gender}"
    puts "Breed & colour: #{animal.breed_and_colour}"

    if animal.can_live_with
      puts "Can live with: #{animal.can_live_with}"
    end

    if animal.bio
      puts "Bio: #{animal.bio}"
    end

    puts "Animal reference number: #{animal.reference}"
    puts "Visit my page: #{animal.profile_url}"
  end

end
