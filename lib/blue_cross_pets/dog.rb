require "./lib/blue_cross_pets/pet"

class BlueCrossPets::Dog < BlueCrossPets::Pet

  def self.gets_dogs
    #to scrape all dogs:
    dog_array = BlueCrossPets::Scraper.scrape_index("https://www.bluecross.org.uk/rehome/dog")
    #this output needs to get used in create_from_collection
    create_from_index(dog_array)
    #this will create a collection to list
    list_all
  end

  def self.get_dog_info(input)
    #reference the input-1 object in your all array
    index = input.to_i - 1
    animal = all[index]
    puts "#{animal.name}"
    #get attributes for that dog
    #if the dog's bio already exists then just return the dog instance
    #otherwise, fetch the data, then return the dog instance.
  end


end
