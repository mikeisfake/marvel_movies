class CBMovies::CLI

  def call
    greet
  end

  def greet
    puts <<'.'
    ______  ______  __    __  __  ______       ______  ______  ______  __  __
   /\  ___\/\  __ \/\ "-./  \/\ \/\  ___\     /\  == \/\  __ \/\  __ \/\ \/ /
   \ \ \___\ \ \/\ \ \ \-./\ \ \ \ \ \____    \ \  __<\ \ \/\ \ \ \/\ \ \  _"-.
    \ \_____\ \_____\ \_\ \ \_\ \_\ \_____\    \ \_____\ \_____\ \_____\ \_\ \_\
     \/_____/\/_____/\/_/  \/_/\/_/\/_____/     \/_____/\/_____/\/_____/\/_/\/_/

    __    __  ______  __   ____  ______       ______  __  __   __  _____   ______  ______
   /\ "-./  \/\  __ \/\ \ / /\ \/\  ___\     /\  ___\/\ \/\ "-.\ \/\  __-./\  ___\/\  == \
   \ \ \-./\ \ \ \/\ \ \ \'/\ \ \ \  __\     \ \  __\\ \ \ \ \-.  \ \ \/\ \ \  __\\ \  __<
    \ \_\ \ \_\ \_____\ \__| \ \_\ \_____\    \ \_\   \ \_\ \_\\"\_\ \____-\ \_____\ \_\ \_\
     \/_/  \/_/\/_____/\/_/   \/_/\/_____/     \/_/    \/_/\/_/ \/_/\/____/ \/_____/\/_/ /_/

.
    puts ""
    puts "  "+"Welcome to Mikes Comic Book Movie Movie Finder!".colorize(:green).underline
    puts ""
    puts "  Type "+"'dceu'".colorize(:green)+" for a list of DCEU films, type "+"'mcu'".colorize(:green)+" for a list of MCU films, type "+"'xmen'".colorize(:green)+" for a list of X-Men films, or type "+"'exit'".colorize(:red)+" to leave"
    input = gets.strip

    case input
    when "dceu"
      CBMovies::Movie.clear
      CBMovies::Movie.dc_from_hash
      list_movies
    when "mcu"
      CBMovies::Movie.clear
      CBMovies::Movie.marvel_from_hash
      list_movies
    when "xmen"
      CBMovies::Movie.clear
      CBMovies::Movie.xmen_from_hash
      list_movies
    when "exit"
      goodbye
    else
      puts "Please enter a valid command.".colorize(:red)
      greet
    end
  end

  def list_movies
    puts ""
    puts "  "+"All movies in release order:".colorize(:green).underline
    puts ""
    CBMovies::Movie.all.each.with_index(1).map {|movie,i| puts "    #{i}. ".colorize(:green)+"#{movie.title}"}
    menu
  end

  def menu
    puts ""
    puts " >"+" Choose a movie you'd like to know more about by typing its number from the list.".colorize(:green)
    puts " > type "+"'dceu'".colorize(:green)+" to see DCEU movies."
    puts " > type "+"'mcu'".colorize(:green)+" to see MCU movies."
    puts " > type "+"'xmen'".colorize(:green)+" to see X-Men movies."
    puts " > type "+"'list'".colorize(:green)+" to see the same movies again."
    puts " > type "+"'exit'".colorize(:red)+" to leave."
    puts ""
    input = gets.strip

    if input == "list"
      list_movies
    elsif input == "mcu"
      CBMovies::Movie.clear
      CBMovies::Movie.marvel_from_hash
      list_movies
    elsif input == "dceu"
      CBMovies::Movie.clear
      CBMovies::Movie.dc_from_hash
      list_movies
    elsif input == "xmen"
      CBMovies::Movie.clear
      CBMovies::Movie.xmen_from_hash
      list_movies
    elsif input.to_i > 0 && input.to_i < CBMovies::Movie.all.length + 1
      movies = CBMovies::Movie.all
      puts ""
      puts "****************************************************"
      puts ""
      puts "   "+"#{movies[input.to_i - 1].title}".colorize(:green).underline+" #{movies[input.to_i - 1].release_date}"
      puts ""
      puts "      Director:".colorize(:light_cyan)+" #{movies[input.to_i - 1].director}"
      puts "      Rating:".colorize(:light_cyan)+" #{movies[input.to_i - 1].rating}"
      puts "      Runtime:".colorize(:light_cyan)+" #{movies[input.to_i - 1].runtime}"
      puts "      Genre:".colorize(:light_cyan)+" #{movies[input.to_i - 1].genre}"
      puts "      Metascore:".colorize(:light_cyan)+" #{movies[input.to_i - 1].metascore}"
      puts "      Description:".colorize(:light_cyan)+" #{movies[input.to_i - 1].description}"
      puts ""
      puts "****************************************************"
      menu
    elsif input == "exit"
      goodbye
    else
      puts ""
      puts "Please make a valid selection.".colorize(:red)
      menu
    end
  end

  def goodbye
    puts ""
    puts "Hope you learned something about the wide world of comic book movies! Bye!".green.underline
    puts ""
  end

end
