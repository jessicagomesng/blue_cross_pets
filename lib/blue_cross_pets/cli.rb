#CLI Controller

class BlueCrossPets::CLI

  def call
    puts "Welcome to the Blue Cross Pet Shelter!"
    puts "We heard you're interested in adopting a furry friend."
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
        puts "Woof! Fetching dogs..."
        puts "Paw-fect choice! Here is a list of our available pets: "
        #depicts choose_pet for dog
        choose_pet
      when "cats"
        puts "Meow! Fetching cats..."
        puts "Paw-fect choice! Here is a list of our available pets: "
        #depicts choose_pet for cat
        choose_pet
      else
        puts "Sorry, we didn't understand that!"
        choose_animal
      end
    end
  end

  def choose_pet
    #numbered list of all available pet types, based off scraper data
    #human inputs which cat they want. Otherwise, they want to go back & recall choose_animal
    input = nil
    if input != "exit"
      puts "Please enter the number of the pet you'd like more info on, or type 'list' to choose a different animal, or 'exit' to exit."
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on pet 1..."
      when "2"
        puts "More info on pet 2..."
      when "list"
        choose_animal
      else
        puts "Sorry, we didn't understand that!"
        choose_pet
      end
    end
  end

  def goodbye
    puts "Thanks for stopping by! Have a great day!"
  end

end
