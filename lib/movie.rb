

class MarvelMovies::Movie

  attr_accessor :title, :director, :release_date, :description

  def initialize

  end

  def self.all
    MarvelMovies::MarvelScraper.list_of_movies
    #needs to be an array of movie objects
  end

  def title
    MarvelMovies::MarvelScraper.cards.each {|movie| self.title = movie.css("p.card-body__headline").text.strip}
  end



end
