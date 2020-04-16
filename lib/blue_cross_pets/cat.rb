require "./lib/blue_cross_pets/pet"

class BlueCrossPets::Cat < BlueCrossPets::Pet

  def self.get_cats

    if all.length == 0
      cat_array = BlueCrossPets::Scraper.scrape_index("https://www.bluecross.org.uk/rehome/cat")
      create_from_index(cat_array)
      list_all
    elsif all.length > 0
      list_all
    end

  end

end
