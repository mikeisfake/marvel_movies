class MarvelMovies::CLI

  def call
    list_movies
    menu
    goodbye
  end

  def list_movies
    puts "All Movies in the MCU:"
    puts "   1. Iron Man"
    puts "   2. The Incredible Hulk"
    puts "   3. Iron Man 2"
    puts "   4. Thor"
    puts "   5. Captain America: The First Avenger"
    puts "   6. The Avengers"
  end

  def menu
    input = nil

    while input != "exit"
      puts "Choose a movie you'd like to know more about by selecting a number, tyle list to see the movies again, or type exit to leave"
      input = gets.strip

      case input
      when "1"
        puts "more about Iron Man"
      when "2"
        puts "more info on The Incredible Hulk"
      when "list"
        list_movies
      end
    end
  end

  def goodbye
    puts "Hope you learned something about the MCU! Bye!"
  end

end
