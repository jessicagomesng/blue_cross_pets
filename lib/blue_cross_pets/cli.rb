#CLI Controller 

class BlueCrossPets::CLI 
  
  def call
    puts "Welcome to the Blue Cross Pet Shelter!"
    puts "We heard you're interested in adopting a furry friend."
    choose_animal
    choose_pet
  end 
  
  def choose_animal 
    puts "To learn more about our adoptable dogs, type 'dogs'. To learn more about our adoptable cats, type 'cats'. To exit, type 'exit'." 
    input = gets.strip
    if input == "dogs"
      puts "Woof! Fetching dogs..."
      #depicts choose_pet for dog
    elsif input == "cats"
      puts "Meow! Fetching cats..."
      #depicts choose_pet for cat
    elsif input == "exit"
      goodbye
    else
      puts "Sorry, we didn't understand that! Please type 'dogs' to learn more about dogs, 'cats' to learn more about cats, or 'exit' to exit."
      input = gets.strip
    end 
  end 
  
  def choose_pet 
    puts "Purrfect choice! Here is a list of our available #{pet_type}s: "
    #numbered list of all available pet types, based off scraper data 
    #human inputs which cat they want. Otherwise, they want to go back & recall choose_animal
  end 
  
  def goodbye
    puts "Thanks for stopping by! Have a great day!"
  end 
  
end
