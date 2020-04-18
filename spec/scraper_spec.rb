require "spec_helper"

RSpec.describe BlueCrossPets::Scraper do
  #These tests are based on current data from the Blue Cross website.
  #Because this data is updated all of the time, these test links will need to be updated based off current data from https://www.bluecross.org.uk/rehome/dog".

  describe "#scrape_index" do
    it 'is a class method that correctly scrapes names, breed, gender, age, profile URL, and availability from Blue Cross and returns an array of hashes for each animal' do
      dog_index_url = "https://www.bluecross.org.uk/rehome/dog"
      scraped_dogs = BlueCrossPets::Scraper.scrape_index(dog_index_url)
      expect(scraped_dogs).to be_a(Array)
      expect(scraped_dogs.first).to have_key(:name)
      expect(scraped_dogs.first).to have_key(:breed)
      expect(scraped_dogs.first).to have_key(:gender)
      expect(scraped_dogs.first).to have_key(:age)
      expect(scraped_dogs.first).to have_key(:profile_url)
      expect(scraped_dogs.first).to have_key(:availability)

      cat_index_url = "https://www.bluecross.org.uk/rehome/cat"
      scraped_cats = BlueCrossPets::Scraper.scrape_index(cat_index_url)
      expect(scraped_cats).to be_a(Array)
      expect(scraped_cats.first).to have_key(:name)
      expect(scraped_cats.first).to have_key(:breed)
      expect(scraped_cats.first).to have_key(:gender)
      expect(scraped_cats.first).to have_key(:age)
      expect(scraped_cats.first).to have_key(:profile_url)
      expect(scraped_cats.first).to have_key(:availability)
    end
  end

  describe "#scrape_profile" do
    it "is a class method that scrapes the animal's profile page and returns a hash of attributes describing that animal" do
      profile_url = "https://www.bluecross.org.uk/pet/luna-1126964?type=adopt"
      scraped_dog = BlueCrossPets::Scraper.scrape_profile(profile_url)
      expect(scraped_dog).to be_a(Hash)
      expect(scraped_dog).to have_key(:bio)
      expect(scraped_dog).to have_key(:breed_and_colour)
      expect(scraped_dog).to have_key(:reference)
      expect(scraped_dog).to have_key(:can_live_with)
    end

    it "does not scrape information that is not listed on the profile" do
      profile_url = "https://www.bluecross.org.uk/pet/reggie-1123040?type=adopt"
      scraped_dog = BlueCrossPets::Scraper.scrape_profile(profile_url)
      expect(scraped_dog).not_to have_key(:can_live_with)
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
