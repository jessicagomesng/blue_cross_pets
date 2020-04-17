class BlueCrossPets::Scraper

  def self.scrape_index(index_url)
    html = open(index_url)

    pet_index = Nokogiri::HTML(html)
    pets = []

    profile_url =

    #pet_index.css("div.item__text-wrapper").each do |pet_info|
    pet_index.css("a.item__link").each do |pet_info|
      name = pet_info.css("h3.item__title").text
      breed = pet_info.css("ul.item__body li")[0].text
      gender = pet_info.css("ul.item__body li")[1].text
      age = pet_info.css("ul.item__body li")[2].text.gsub("\n", "").gsub("\t", "").strip
      profile_url = "https://www.bluecross.org.uk" + pet_info.attribute("href").value
      #need to find a way to also add availability here
      #need to get profile URL here

      pets << {name: name, breed: breed, gender: gender, age: age, profile_url: profile_url}
    end

    pets
  end

  def self.scrape_profile(profile_url)
    pet_profile = Nokogiri::HTML(open(profile_url))

    attributes_hash = {}

    attributes_hash[:bio] = pet_profile.css("div.column-main p").text

    pet_profile.css("div.column-aside").each do |attribute|

      attributes_hash[:breed_and_colour] = attribute.css("li.pet-details_species").text.split(" - ")[1].strip
      attributes_hash[:reference] = attribute.css("li.pet-details_reference").text.gsub("\n", "").split(":")[1].strip

      if attribute.css("li.pet-details_info").length > 0
        attributes_hash[:can_live_with] = attribute.css("li.pet-details_info").text.gsub("\n", "").split(":")[1].strip
      end
      
    end

    attributes_hash
  end

end

#see if I can find a way to list them together if they come in a pair
