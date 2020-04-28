#CLI Controller

class BlueCrossPets::CLI

  attr_accessor :current_animal

  def call
    puts "Woof! Welcome to the ".bold +  "Blue Cross Pet Shelter!".light_white.on_blue.bold + " We heard you're interested in adopting a furry friend.".bold
    choose_animal_type
    goodbye
  end

  def choose_animal_type
    puts "To learn more about our adoptable dogs, type '" + "dogs".light_white + "'. To learn more about our adoptable cats, type '" + "cats".light_white + "'. To exit, type '" + "exit".light_white + "'."
    input = gets.strip.downcase
      case input
        when "dogs"
          @current_animal = "dog"
          puts "----------------------------- Our dogs: -----------------------------".blue
          BlueCrossPets::Dog.create_dogs
          list_all
          choose_animal
        when "cats"
          @current_animal = "cat"
          puts "----------------------------- Our cats: -----------------------------".blue
          BlueCrossPets::Cat.create_cats
          list_all
          choose_animal
        when "exit"
        else
          puts "Sorry, we didn't understand that!".red
          choose_animal_type
      end
  end

  def list_all
    if @current_animal == "dog"
      BlueCrossPets::Dog.all.each.with_index(1) do |dog, index|
        puts "#{index}. ".blue + "#{dog.name} - #{dog.breed} - #{dog.gender} - #{dog.age} - #{dog.availability}"
      end

    elsif @current_animal == "cat"
      BlueCrossPets::Cat.all.each.with_index(1) do |dog, index|
        puts "#{index}. ".blue + "#{dog.name} - #{dog.breed} - #{dog.gender} - #{dog.age} - #{dog.availability}"
      end
    end 
  end 

  def number?(input)
    input = input.to_s unless input.is_a? String
    !!(/\A[+-]?\d+\z/.match(input))
  end

  def choose_animal
    puts "Please enter the number of the pet you'd like more info on, or type '" + "menu".light_white + "' to choose a different animal, or '" + "exit".light_white + "' to exit."
    input = gets.strip.downcase

    if number?(input) == true
      if @current_animal == "dog" && input.to_i.between?(1, BlueCrossPets::Dog.all.length) || @current_animal == "cat" && input.to_i.between?(1, BlueCrossPets::Cat.all.length)
        puts "Paw-fect choice!".light_white
        list_additional_info(input)
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

  def list_additional_info(input)
    index = input.to_i - 1

    if @current_animal == "dog" && input.to_i.between?(1, BlueCrossPets::Dog.all.length)
      pet_choice = BlueCrossPets::Dog.all[index]
    elsif @current_animal == "cat" && input.to_i.between?(1, BlueCrossPets::Cat.all.length)
      pet_choice = BlueCrossPets::Cat.all[index]
    end 

    pet_choice.get_more_info 
    
    puts "----------------------------- All about #{pet_choice.name} -----------------------------".blue
    puts "Age: ".light_white + "#{pet_choice.age}"
    puts "Gender: ".light_white + "#{pet_choice.gender}"
    puts "Availability: ".light_white + "#{pet_choice.availability}"
    puts "Breed & colour: ".light_white + "#{pet_choice.breed_and_colour}"

    if pet_choice.can_live_with
      puts "Can live with: ".light_white + "#{pet_choice.can_live_with}"
    end

    puts "Bio: ".light_white + "#{pet_choice.bio}"
    puts "Animal reference number: ".light_white + "#{pet_choice.reference}"
    puts "Visit my page: ".light_white + "#{pet_choice.profile_url}"
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
