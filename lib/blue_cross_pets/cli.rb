#CLI Controller 

class BlueCrossPets::CLI 
  
  def call
    puts "Welcome to the Blue Cross Pet Shelter!"
    puts "We heard you're interested in adopting a furry friend."
    choose_animal
  end 
  
  def choose_animal 
    puts "To learn more about our adoptable dogs, type 'dogs'. To learn more about our adoptable cats, type 'cats'. To exit, type 'exit'." 
    input = gets.strip
    if input == "dogs"
      puts "Woof! Fetching dogs..."
    elsif input == "cats"
      puts "Purrfect! Fetching cats..."
    elsif input == "exit"
      goodbye
    else
      puts "Sorry, we didn't understand that! Please type 'dogs' to learn more about dogs, 'cats' to learn more about cats, or 'exit' to exit."
      input = gets.strip
    end 
  end 
  
  def goodbye
    puts "Thanks for stopping by! Have a great day!"
  end 
  
end
