#CLI Controller

class BlueCrossPets::CLI

  attr_accessor :current_animal

  def call
    puts "Woof! Welcome to the ".bold +  "Blue Cross Pet Shelter!".light_white.on_blue.bold + " We heard you're interested in adopting a furry friend.".bold
    choose_animal_type
    goodbye
  end

  def choose_animal_type
    puts "To learn more about our adoptable dogs, type 'dogs'. To learn more about our adoptable cats, type 'cats'. To exit, type 'exit'."
    input = gets.strip.downcase
      case input
        when "dogs"
          @current_animal = "dog"
          puts "----------------------------- Our dogs: -----------------------------".blue
          BlueCrossPets::Dog.scrape_dogs
          choose_animal
        when "cats"
          @current_animal = "cat"
          puts "----------------------------- Our cats: -----------------------------".blue
          BlueCrossPets::Cat.scrape_cats
          choose_animal
        when "exit"
        else
          puts "Sorry, we didn't understand that!".red
          choose_animal_type
      end
  end

  def number?(input)
    input = input.to_s unless input.is_a? String
    !!(/\A[+-]?\d+\z/.match(input))
  end

  def choose_animal
    puts "Please enter the number of the pet you'd like more info on, or type 'menu' to choose a different animal, or 'exit' to exit."
    input = gets.strip.downcase

    if number?(input) == true
      if @current_animal == "dog" && input.to_i.between?(1, BlueCrossPets::Dog.all.length)
        puts "Paw-fect choice!".light_white
        BlueCrossPets::Dog.get_more_info(input)
      elsif @current_animal == "cat" && input.to_i.between?(1, BlueCrossPets::Cat.all.length)
        puts "Paw-fect choice!".light_white
        BlueCrossPets::Cat.get_more_info(input)
      else
        puts "Sorry, we didn't understand that!".red
      end
      choose_animal
    else
      case input
      when "menu"
        choose_animal_type
      when "exit"
      else
        puts "Sorry, we didn't understand that!".red
        choose_animal
      end
    end
  end

  def goodbye
    puts "Thanks for stopping by! Have a great day!".blue.bold
    text = <<-TEXT
       h  h
     h(")(")h
    ("),--.(")
     :"    ";
     `.____,'
     TEXT
    puts text.light_white
  end

end
