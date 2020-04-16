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

    #if !animal.bio
      BlueCrossPets::Scraper.scrape_profile(animal.profile_url)
    #elsif animal.bio
    puts "All about #{animal.name}:"
    puts "Age: #{animal.age}"
    puts "Gender: #{animal.gender}"
    puts "Breed & colour: #{animal.breed_and_colour}"
    puts "Can live with: #{animal.can_live_with}"
    puts "Bio: #{animal.bio}"
    puts "Animal reference number: #{animal.reference}"
    puts "Visit my page: #{animal.profile_url}"
    #:breed, :gender, :age, :availability, :profile_url, :bio, :breed_and_colour, :can_live_with, :reference
    #get attributes for that dog
    #if the dog's bio already exists then just return the dog instance
    #otherwise, fetch the data, then return the dog instance.
    #end
  end


end
