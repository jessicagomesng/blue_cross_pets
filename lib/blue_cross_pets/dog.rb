class BlueCrossPets::Dog

  attr_accessor :name, :age, :breed, :gender, :availability, :profile_url

  def self.list_all
    #should return a list of instances of available dogs
    puts "1. Peety"
    dog_1 = self.new
    dog_1.name = "Peety"
    dog_1.age = "14 years old"
    dog_1.breed = "Cavalier King Charles Spaniel"
    dog_1.gender = "male"
    dog_1.availability = "nope"
    dog_1.profile_url = "not for sale!"

    dog_2 = self.new
    dog_2.name = "Pepper"
    dog_2.age = "3 years old"
    dog_2.breed = "schnoodle"
    dog_2.gender = "female"
    dog_2.availability = "nope"
    dog_2.profile_url = "not for sale!"

    [dog_1, dog_2]
  end

end
