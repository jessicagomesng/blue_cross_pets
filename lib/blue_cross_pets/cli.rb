#CLI Controller

class BlueCrossPets::CLI

  attr_accessor :current_animal

  def call
    puts "Woof! Welcome to the" + "Blue Cross Pet Shelter!" + "We heard you're interested in adopting a furry friend."
    choose_animal_type
    goodbye
  end

  #see if I can loop this better
  def choose_animal_type
    puts "To learn more about our adoptable dogs, type 'dogs'. To learn more about our adoptable cats, type 'cats'. To exit, type 'exit'."
    input = gets.strip.downcase
      case input
      when "dogs"
        @current_animal = "dog"
        puts "Paw-fect choice! Here is a list of our dogs: "
        BlueCrossPets::Dog.scrape_dogs
        choose_animal
      when "cats"
        @current_animal = "cat"
        puts "Paw-fect choice! Here is a list of our cats: "
        BlueCrossPets::Cat.scrape_cats
        choose_animal
      when "exit"
      else
        puts "Sorry, we didn't understand that!"
        choose_animal_type
      end
  end

  def number?(input)
    input = input.to_s unless input.is_a? String
    !!(/\A[+-]?\d+\z/.match(input))
  end

  #see if I can loop this better
  def choose_animal
    puts "Please enter the number of the pet you'd like more info on, or type 'list' to choose a different animal, or 'exit' to exit."
    input = gets.strip.downcase

    if number?(input) == true
      if @current_animal == "dog" && input.to_i.between?(1, BlueCrossPets::Dog.all.length)
        BlueCrossPets::Dog.get_more_info(input)
        choose_animal
      elsif @current_animal == "cat" && input.to_i.between?(1, BlueCrossPets::Cat.all.length)
        BlueCrossPets::Cat.get_more_info(input)
        choose_animal
      else
        puts "Sorry, we didn't understand that!"
        choose_animal
      end
    else
      case input
      when "list"
        choose_animal_type
      when "exit"
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
