#CLI Controller

class BlueCrossPets::CLI

  def call
    puts "Woof! Welcome to the Blue Cross Pet Shelter! We heard you're interested in adopting a furry friend."
    choose_animal
    goodbye
  end

  def choose_animal
    input = nil
    while input != "exit"
    puts "To learn more about our adoptable dogs, type 'dogs'. To learn more about our adoptable cats, type 'cats'. To exit, type 'exit'."
    input = gets.strip.downcase
      case input
      when "dogs"
        puts "Paw-fect choice! Here is a list of our dogs: "
        BlueCrossPets::Dog.scrape_dogs
        choose_dog
      when "cats"
        puts "Paw-fect choice! Here is a list of our cats: "
        BlueCrossPets::Cat.scrape_cats
        #need to add choose_cat
      else
        puts "Sorry, we didn't understand that!"
        choose_animal
      end
    end
  end

  def choose_dog
    #numbered list of all available pet types, based off scraper data
    #human inputs which cat they want. Otherwise, they want to go back & recall choose_animal
    input = nil
    #if input != "exit"
    puts "Please enter the number of the pet you'd like more info on, or type 'list' to choose a different animal, or 'exit' to exit."
      if input != "exit"
        input = gets.strip.downcase
        BlueCrossPets::Dog.get_more_info(input)
        choose_dog
      elsif input == "list"
        choose_animal
      elsif input == "exit"
          goodbye
      end
      #loop to have it choose another pet
      #case input
      #when "1"
      #  puts "More info on pet 1..."
      #when "2"
      #  puts "More info on pet 2..."
      #when "list"
      #  choose_animal
      #else
      #  puts "Sorry, we didn't understand that!"
      #  choose_pet
      #end
    #end
  end

  def goodbye
    puts "Thanks for stopping by! Have a great day!"
  end

end
