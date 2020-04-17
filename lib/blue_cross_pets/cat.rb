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
    self.all.each_with_index do |cat, index|
      puts "#{index + 1}. ".blue + "#{cat.name} - #{cat.breed} - #{cat.gender} - #{cat.age} - #{cat.availability}"
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
    cat = all[index]

    if !cat.reference
      attribute_hash = BlueCrossPets::Scraper.scrape_profile(cat.profile_url)
      cat.add_attributes(attribute_hash)
    elsif cat.reference
    end

    puts "----------------------------- All about #{cat.name} -----------------------------".blue
    puts "Age: ".light_white + "#{cat.age}"
    puts "Gender: ".light_white + "#{cat.gender}"
    puts "Availability: ".light_white + "#{cat.availability}"
    puts "Breed & colour: ".light_white + "#{cat.breed_and_colour}"

    if cat.can_live_with
      puts "Can live with: ".light_white + "#{cat.can_live_with}"
    end

    puts "Bio: ".light_white + "#{cat.bio}"
    puts "Animal reference number: ".light_white + "#{cat.reference}"
    puts "Visit my page: ".light_white + "#{cat.profile_url}"
  end

end
