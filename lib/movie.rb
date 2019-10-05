

class MarvelMovies::Movie

  attr_accessor :title, :release_date, :rating, :runtime, :genre, :metascore

  @@all = []

  def initialize(movie_data)
    movie_data.each {|k,v| self.send("#{k}=", v)}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.movie_from_hash
    MarvelMovies::MarvelScraper.movie_data.each{|hash| self.new(hash)}
  end



end
