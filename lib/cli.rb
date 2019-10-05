class MarvelMovies::CLI

  def call
    make_movies
    greet
  end

  def make_movies
    MarvelMovies::Movie.movie_from_hash
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
    MarvelMovies::Movie.all.each.with_index(1).map {|movie,i| puts "    #{i}. #{movie.title}"}
    #MarvelMovies::MarvelScraper.list_of_movies.each.with_index(1).map {|movie, i| puts "   #{i}. #{movie}" }
    menu
  end

  def menu
    input = nil

    while input != "exit"
      puts "Choose a movie you'd like to know more about by selecting a number, type 'list' to see the movies again, or type exit to leave"
      input = gets.strip

      if input == "list"
        list_movies
      elsif input == "exit"
        goodbye
      else
        movies = MarvelMovies::Movie.all
        puts "#{movies[input.to_i - 1].title}, #{movies[input.to_i - 1].release_date}"
        puts "      Rating: #{movies[input.to_i - 1].rating}"
        puts "      Runtime: #{movies[input.to_i - 1].runtime}"
        puts "      Genre: #{movies[input.to_i - 1].genre}"
        puts "      Metascore: #{movies[input.to_i - 1].metascore}"
      end
    end
  end

  def goodbye
    puts "Hope you learned something about the MCU! Bye!"
  end

end
