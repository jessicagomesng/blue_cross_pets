#CLI Controller

class BlueCrossPets::CLI

  def call
    puts "Woof! Welcome to the Blue Cross Pet Shelter! We heard you're interested in adopting a furry friend."
    choose_animal
    goodbye
  end

  def choose_animal
    input = nil
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
      when "exit"
        goodbye
      else
        puts "Sorry, we didn't understand that!"
        choose_animal
      end
  end

  def number?(input)
    input = input.to_s unless input.is_a? String
    !!(/\A[+-]?\d+\z/.match(input))
  end

  def choose_dog
    #numbered list of all available pet types, based off scraper data
    #human inputs which cat they want. Otherwise, they want to go back & recall choose_animal
    input = nil
    #if input != "exit"
    puts "Please enter the number of the pet you'd like more info on, or type 'list' to choose a different animal, or 'exit' to exit."
    input = gets.strip.downcase

    if number?(input) == true
      BlueCrossPets::Dog.get_more_info(input)
    else
      case input
      when "list"
        choose_animal
      when "exit"
        goodbye
      else
        puts "Sorry, we didn't understand that!"
        choose_animal
      end
    end
  end

  def goodbye
    puts "Thanks for stopping by! Have a great day!"
  end

end
