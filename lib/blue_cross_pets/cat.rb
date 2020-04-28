#require_relative "./pet"

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

  def self.create_cats
    if all.length == 0
      cat_array = BlueCrossPets::Scraper.new.scrape_index("https://www.bluecross.org.uk/rehome/cat")
      create_from_index(cat_array)
    end
  end

end
