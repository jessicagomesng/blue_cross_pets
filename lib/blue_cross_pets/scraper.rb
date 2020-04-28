class BlueCrossPets::Scraper

  def scrape_index(index_url)
    html = open(index_url)

    pet_index = Nokogiri::HTML(html)
    
    pet_index.css("a.item__link").collect do |pet_info|
      name = pet_info.css("h3.item__title").text
      breed = pet_info.css("ul.item__body li")[0].text
      gender = pet_info.css("ul.item__body li")[1].text
      age = pet_info.css("ul.item__body li")[2].text.gsub("\n", "").gsub("\t", "").strip
      profile_url = "https://www.bluecross.org.uk" + pet_info.attribute("href").value

      if pet_info.css("div.banner").length > 0
        availability = "Reserved"
      elsif pet_info.css("div.banner").length == 0
        availability = "Available"
      end

      {name: name, breed: breed, gender: gender, age: age, profile_url: profile_url, availability: availability}
    end
  end

  def scrape_profile(profile_url)
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
