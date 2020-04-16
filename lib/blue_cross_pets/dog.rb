require "./lib/blue_cross_pets/pet"

class BlueCrossPets::Dog < BlueCrossPets::Pet

  def self.get_dogs

    dog_array = BlueCrossPets::Scraper.scrape_index("https://www.bluecross.org.uk/rehome/dog")
    create_from_index(dog_array)
    list_all
    
  end

end
