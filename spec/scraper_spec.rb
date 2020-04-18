require "spec-helper"

RSpec.describe BlueCrossPets::Dog do

  describe '.all' do
    it 'returns an array of all listed dogs' do
    expect(BlueCrossPets::Dog.all).to be_an(Array)
    expect(BlueCrossPets::Dog.all).first.to be_a(BlueCrossPets::Dog)
    end
  end

end

RSpec.describe BlueCrossPets::Cat do

  describe '.all' do
    it 'returns an array of all listed cats' do
    expect(BlueCrossPets::Cat.all).to be_an(Array)
    expect(BlueCrossPets::Cat.all).first.to be_a(BlueCrossPets::Cat)
    end
  end

end

RSpec.describe BlueCrossPets::Scraper do
    it 'correctly scrapes names, breed, gender, age, profile URL, and availability from the Blue Cross website' do
      expect(BlueCrossPets::Dog.)
    end
  end
end


# Pseudocode for tests

#  CLI expectations
#    greets user
#    uses show master list (@@all) in order to list all adoptable dogs or cats -- done
#    allows user to obtain more information on a dog/cat, return to the main menu, or exit the program, puts error message when input is inappropriate.
#    goodbye.

#  Pet expectations:
#    assign attributes to animals

#  Dog expectations: (currently has the aility to do this but it doesnt get called here, it gets called in cli class)
#    create dog objects
#    inherits from Pet class
#    makes a master list of all dogs

#  Scraper expectations
#    scrape a list of all dogs/cats from Blue Cross site
#    for each dog/cat scrape name, breed, gender, age, profile URL, and availability
#    for each dog/cat scrape additional info including breed & colour, bio, reference #, can live with
#    use profile url to scrape additional attributes
