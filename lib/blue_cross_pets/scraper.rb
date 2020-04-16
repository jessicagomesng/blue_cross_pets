class BlueCrossPets::Scraper

  def self.scrape_index(index_url)
    html = open(index_url)

    pet_index = Nokogiri::HTML(html)
    #create a hash with each pet's info. This will then be sent to the pet's class to create a new pet.
    pets = []

    pet_index.css("div.item__text-wrapper").each do |pet_info|
      name = pet_info.css("h3.item__title").text
      breed = pet_info.css("ul.item__body li")[0].text
      gender = pet_info.css("ul.item__body li")[1].text
      age = pet_info.css("ul.item__body li")[2].text.gsub("\n", "").gsub("\t", "").strip

      pets << {name: name, breed: breed, gender: gender, age: age}
    end

    pets
  end

  def self.scrape_profile
  end

end
#each dog is held within:
#dog_index.css("div.item__text-wrapper") |dog_info|
#dog name : dog_info.css("h3.item__title").text
#dog breed:  dog_info.css("ul.item__body li")[0].text
#dog gender: dog_index.css("ul.item__body li")[1].text
#dog age: dog_info.css("ul.item__body li")[2].text.gsub("\n", "").gsub("\t", "").strip
#try to find a more elegant way to gsub this...
#regex = \\n|\\t
