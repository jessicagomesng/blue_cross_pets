class BlueCrossPets::Pet

  attr_accessor :name, :breed, :gender, :age, :availability, :profile_url, :bio, :breed_and_colour, :can_live_with, :reference

  def self.create_from_index(pet_array)
    pet_array.each do |pet_hash|
      self.new(pet_hash)
    end
  end

  def add_attributes(attribute_hash)
    attribute_hash.each do |attribute, value|
      self.send("#{attribute}=".to_sym, value)
    end
    self
  end

end
