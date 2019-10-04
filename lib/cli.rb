class MarvelMovies::CLI

  def call
    greet
    goodbye
  end

  def greet
    puts "Hello, and welcome to Mikes MCU movie database!"
    puts "Type 'list' to see a list of current and upcoming movies in the MCU, or type 'exit' to leave."
    input = gets.strip

    case input
    when "list"
      list_movies
    when "exit"
      goodbye
    else
      puts "Please enter a valid command."
      greet
    end
  end

  def list_movies
    puts "All Movies in the MCU:"
    MarvelMovies::Movie.all.each.with_index(1).map {|movie, i| puts "   #{i}. #{movie}" }
    menu
  end

  def menu
    input = nil

    while input != "exit"
      puts "Choose a movie you'd like to know more about by selecting a number, type 'list' to see the movies again, or type exit to leave"
      input = gets.strip.to_i

      if input == "list"
        list_movies
      elsif input < MarvelMovies::Movie.all.length + 1
        puts MarvelMovies::Movie.all[input - 1]
      else
        goodbye
      end
    end
  end

  def goodbye
    puts "Hope you learned something about the MCU! Bye!"
  end

end
