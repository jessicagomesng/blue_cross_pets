require "spec_helper"

RSpec.describe BlueCrossPets::Pet do
  let!(:dog_index_array) {[{:name=>"Pepper", :age=>"3 years"},
  {:name=>"Fido", :age=>"5 years"},
  {:name=>"Woofer", :age=>"1 year"},
  {:name=>"Skittles", :age=>"13 years"},
  {:name=>"Hershey", :age=>"5 years"},
  {:name=>"Maggie", :age=>"14 years"}]}

  let!(:new_dog) {BlueCrossPets::Dog.new({:name => "Peety", :age => "14 years"})}

  let!(:dog_attribute_hash) {{:gender=>"male",
  :availability=>"reserved",
  :breed_and_colour=>"Cavalier King Charles Spaniel, tricolour",
  :can_live_with=>"Dogs, children",
  :reference=>"123456",
  :profile_url=>"https://www.bluecross.org.uk",
  :bio=>"I'm super cute!"}}

  context 'ClassMethods' do

    describe ".create_from_index" do
     it "uses the Scraper class to create new animals with the correct name and location." do
       BlueCrossPets::Dog.class_variable_set(:@@dogs, [])
       BlueCrossPets::Dog.create_from_index(dog_index_array)
       expect(BlueCrossPets::Dog.class_variable_get(:@@dogs).first.name).to eq("Pepper")
       expect(BlueCrossPets::Dog.class_variable_get(:@@dogs).first).to be_a(BlueCrossPets::Dog)
     end
   end
 end

 context 'InstanceMethods' do
   describe "#add_attributes" do
     it "uses the Scraper class to get additional attributes stored as a hash for each animal, and then adds those attributes to each animal from the hash." do
       new_dog.add_attributes(dog_attribute_hash)
       expect(new_dog.gender).to eq("male")
       expect(new_dog.availability).to eq("reserved")
       expect(new_dog.breed_and_colour).to eq("Cavalier King Charles Spaniel, tricolour")
       expect(new_dog.can_live_with).to eq("Dogs, children")
       expect(new_dog.reference).to eq("123456")
       expect(new_dog.profile_url).to eq("https://www.bluecross.org.uk")
       expect(new_dog.bio).to eq("I'm super cute!")
     end
   end
 end

end

RSpec.describe BlueCrossPets::Dog do
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

      it "adds that dog to the Dog class' collection of all existing dogs, stored in the @@dogs class variable." do
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
  let!(:new_cat) {BlueCrossPets::Cat.new({:name => "Harley", :age => "20 years"})}

  after(:each) do
    BlueCrossPets::Cat.class_variable_set(:@@cats, [])
  end

  it 'inherits from the Pet class' do
    expect(BlueCrossPets::Cat.methods).to include(:create_from_index)
  end

  context 'ClassMethods' do
    describe 'initialize' do
      it "initializes with a hash and sets the cat's's attributes using the hash's key/value pairs" do
        expect{BlueCrossPets::Cat.new({:name => "Maddie", :age => "11 years", :availability => "available"})}.to_not raise_error
        expect(new_cat.name).to eq("Harley")
        expect(new_cat.age).to eq("20 years")
      end

      it "adds that cat to the Cat class' collection of all existing cats, stored in the @@cats class variable." do
        expect(BlueCrossPets::Cat.class_variable_get(:@@cats).first.name).to eq("Harley")
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
