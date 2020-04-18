require "spec_helper"

#RSpec.describe BlueCrossPets::Pet do
#  describe ".create_from_index" do
#   it "uses the Scraper class to create new dogs with the correct name and location." do
#     BlueCrossPets::Dog.class_variable_set(:@@all, [])
#     BlueCrossPets::Dog.create_from_collection(student_index_array)
#     expect(Student.class_variable_get(:@@all).first.name).to eq("Alex Patriquin")
#   end
# end
#end

RSpec.describe BlueCrossPets::Dog do

  let!(:dog_index_array) {[{:name=>"Pepper", :age=>"3 years"},
  {:name=>"Fido", :age=>"5 years"},
  {:name=>"Woofer", :age=>"1 year"},
  {:name=>"Skittles", :age=>"13 years"},
  {:name=>"Hershey", :age=>"5 years"},
  {:name=>"Maggie", :age=>"14 years"}]}

  #let!(:dog_attribute_hash) {{:gender=>"male",
  #:availability=>"available",
  #:breed_and_colour=>"Cavalier King Charles Spaniel, tricolour",
  #:can_live_with=>"Dogs, children",
  #:reference=>"123456",
  #:profile_url=>"https://www.bluecross.org.uk"
  #:bio=>"I'm super cute!"}}

  let!(:new_dog) {BlueCrossPets::Dog.new({:name => "Peety", :age => "14 years"})}

  after(:each) do
    BlueCrossPets::Dog.class_variable_set(:@@dogs, [])
  end

  it 'inherits from the Pet class' do
    expect(BlueCrossPets::Dog.methods).to include(:create_from_index)
  end

  context 'ClassMethods' do
    describe 'initialize' do
      it "initializes with a hash and sets the dog's attributes using the hash's key/value pairs" do
        expect{BlueCrossPets::Dog.new({:name => "Peaches", :age => "4 years", :availability => "reserved"})}.to_not raise_error
        expect(new_dog.name).to eq("Peety")
        expect(new_dog.age).to eq("14 years")
      end

      it "adds that dog the Dog class' collection of all existing dogs, stored in the @@all class variable." do
        expect(BlueCrossPets::Dog.class_variable_get(:@@dogs).first.name).to eq("Peety")
      end
    end

    describe '.all' do
      it 'returns an array of all listed dogs' do
      expect(BlueCrossPets::Dog.all).to be_an(Array)
      expect(BlueCrossPets::Dog.all.first).to be_a(BlueCrossPets::Dog)
      end
    end

  end

end

RSpec.describe BlueCrossPets::Cat do
  context 'ClassMethods' do
    describe 'initialize' do
      it "initializes with a hash and sets the cat's attributes using the hash's key/value pairs" do
        expect{BlueCrossPets::Cat.new({:name => "Maddie", :age => "11 years"})}.to_not raise_error
      end
    end

    describe '.all' do
      it 'returns an array of all listed cats' do
      expect(BlueCrossPets::Cat.all).to be_an(Array)
      expect(BlueCrossPets::Cat.all.first).to be_a(BlueCrossPets::Cat)
      end
    end
  end

end

#  Pet expectations:
#    assign attributes to animals

#  Dog expectations: (currently has the aility to do this but it doesnt get called here, it gets called in cli class)
#    create dog objects
#    inherits from Pet class
#    makes a master list of all dogs
