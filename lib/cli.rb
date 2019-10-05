class MarvelMovies::CLI

  def call
    make_movies
    greet
  end

  def make_movies
    MarvelMovies::Movie.movie_from_hash
  end

  def greet
    puts "Hello, and welcome to Mikes MCU movie database!".colorize(:color => :red, :background => :white).bold
    puts "Type "+"'list'".colorize(:red)+" to see a list of current and upcoming movies in the MCU, or type "+"'exit'".colorize(:red)+" to leave."
    input = gets.strip

    case input
    when "list"
      list_movies
    when "exit"
      goodbye
    else
      puts "Please enter a valid command.".colorize(:cyan)
      greet
    end
  end

  def list_movies
    puts "All Movies in the MCU:".colorize(:color => :white, :background => :red).bold
    MarvelMovies::Movie.all.each.with_index(1).map {|movie,i| puts "    #{i}. "+"#{movie.title}".colorize(:light_red)}
    menu
  end

  def menu
    input = nil

    while input != "exit"
      puts ""
      puts "++Choose a movie you'd like to know more about by typing its number from the list.++".colorize(:color => :red, :background => :white).bold
      puts "or"
      puts " -type "+"'list'".colorize(:cyan)+" to see the movies again."
      puts " -type "+"'exit'".colorize(:red)+" to leave."
      input = gets.strip

      if input == "list"
        list_movies
      elsif input == "exit"
        goodbye
      elsif input.to_i > 0 && input.to_i < MarvelMovies::Movie.all.length - 1
        movies = MarvelMovies::Movie.all
        puts "#{movies[input.to_i - 1].title}".colorize(:cyan)+", #{movies[input.to_i - 1].release_date}"
        puts "   Rating:".colorize(:light_red)+" #{movies[input.to_i - 1].rating}"
        puts "   Runtime:".colorize(:light_red)+" #{movies[input.to_i - 1].runtime}"
        puts "   Genre:".colorize(:light_red)+" #{movies[input.to_i - 1].genre}"
        puts "   Metascore:".colorize(:light_red)+" #{movies[input.to_i - 1].metascore}"
        puts ""
      else
        puts "Please make a valid selection."
      end
    end
  end

  def goodbye
    puts "Hope you learned something about the MCU! Bye!".bold
    return
  end

end
