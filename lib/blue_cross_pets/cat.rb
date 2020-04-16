require "./lib/blue_cross_pets/pet"

class BlueCrossPets::Cat < BlueCrossPets::Pet

  def self.get_cats
    #to scrape all dogs:
    cat_array = BlueCrossPets::Scraper.scrape_index("https://www.bluecross.org.uk/rehome/cat")
    #this output needs to get used in create_from_collection
    create_from_index(cat_array)
    #this will create a collection to list
    list_all
  end

end
