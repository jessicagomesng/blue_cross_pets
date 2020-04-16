require "./lib/blue_cross_pets/pet"

class BlueCrossPets::Cat < BlueCrossPets::Pet

  def self.get_cats
    cat_array = BlueCrossPets::Scraper.scrape_index("https://www.bluecross.org.uk/rehome/cat")
    create_from_index(cat_array)
    list_all
  end

end
