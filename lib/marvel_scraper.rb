class MarvelMovies::MarvelScraper

  def self.doc
    Nokogiri::HTML(open("https://www.imdb.com/list/ls022528471/"))
  end

  def self.cards
    self.doc.css(".lister-item-content")
  end

  def self.list_of_movies
    title_array = []
    self.cards.each { |card| title_array << card.css("h3 a").text }
    title_array
  end

  def self.movie_data
    movie_array = []

    self.cards.each_with_index do |card,i|
      movie_array[i] = {
        :title => card.css("h3 a").text,
        :release_date => card.css("h3 .lister-item-year").text,
        :rating => card.css(".certificate").text,
        :runtime => card.css(".runtime").text,
        :genre => card.css(".genre").text.strip,
        :metascore => card.css(".metascore").text.strip
      }
    end
    movie_array
  end



end
