class BlueCrossPets::Scraper

  def self.scrape_dogs(index_url)
    html = open(index_url)

    dog_index = Nokogiri::HTML(html)
  end

  def self.scrape_cats

  end

  def self.scrape_dog_profile

  end

  def self.scrape_cat_profile
  end

end
#each dog is held within:
#dog_index.css("div.item__text-wrapper")
#dog name : dog_index.css("h3.item__title").first.text
#dog breed:  dog_index.css("ul.item__body li").first
#dog gender: dog_index.css("ul.item__body li")[1].text
