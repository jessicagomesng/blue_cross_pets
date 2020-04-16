require "./lib/blue_cross_pets/pet"

class BlueCrossPets::Dog < BlueCrossPets::Pet

  def self.get_dogs

    if all.length == 0
      dog_array = BlueCrossPets::Scraper.scrape_index("https://www.bluecross.org.uk/rehome/dog")
      create_from_index(dog_array)
      list_all
    elsif all.length > 0
      list_all
    end

  end

end
