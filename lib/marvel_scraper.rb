class MarvelMovies::MarvelScraper

  def self.doc
    Nokogiri::HTML(open("https://www.marvel.com/movies"))
  end

  def self.cards
    #returns array of "movie" objects
    self.doc.css("#content_grid-3 .grid__6 .mvl-card--lob")
  end

  def self.list_of_movies
    title_array = []
    self.cards.each {|card| title_array << card.css("p.card-body__headline").text.strip}
    title_array
    #returns array of just movie titles as strings
  end

end
