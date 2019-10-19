class CBMovies::Movie

  attr_accessor :title, :director, :release_date, :rating, :runtime, :genre, :metascore, :description

  @@all = []

  def initialize(movie_data)
    movie_data.each {|k,v| self.send("#{k}=", v)}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.marvel_from_hash
    CBMovies::Scraper.marvel_movie_data.each{|hash| self.new(hash)}
  end

  def self.dc_from_hash
    CBMovies::Scraper.dc_movie_data.each{|hash| self.new(hash)}
  end

  def self.xmen_from_hash
    CBMovies::Scraper.xmen_movie_data.each{|hash| self.new(hash)}
  end

  def self.clear
    self.all.clear 
  end

end
