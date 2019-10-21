class CBMovies::Movie

  attr_accessor :title, :director, :release_date, :rating, :runtime, :genre, :metascore, :description

  def initialize(movie_data)
    movie_data.each {|k,v| self.send("#{k}=", v)}
  end

  def self.marvel_from_hash
    @@all_marvel ||= CBMovies::Scraper.movie_data(
      "https://www.imdb.com/list/ls022528471/").map{|hash| self.new(hash)}
  end

  def self.dc_from_hash
    @@all_dc ||= CBMovies::Scraper.movie_data(
      "https://www.imdb.com/list/ls062501894/").map{|hash| self.new(hash)}
  end

  def self.xmen_from_hash
    @@all_xmen ||= CBMovies::Scraper.movie_data(
      "https://www.imdb.com/list/ls024445822/").map{|hash| self.new(hash)}
  end

end
