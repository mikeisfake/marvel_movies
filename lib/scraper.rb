class CBMovies::Scraper

  def self.marvel_movie_data
    doc = Nokogiri::HTML(open("https://www.imdb.com/list/ls022528471/"))
    cards = doc.css(".lister-item-content")

    self.scrape(cards)
  end

  def self.dc_movie_data
    doc = Nokogiri::HTML(open("https://www.imdb.com/list/ls062501894/"))
    cards = doc.css(".lister-item-content")

    self.scrape(cards)
  end

  def self.xmen_movie_data
    doc = Nokogiri::HTML(open("https://www.imdb.com/list/ls024445822/"))
    cards = doc.css(".lister-item-content")

    self.scrape(cards)
  end

  def self.scrape(cards)
    movie_array = []

    cards.each_with_index do |card,i|
      movie_array[i] = {
        :title => card.css("h3 a").text,
        :director =>(card.css("p")[2].css("a")[0].text if card.css("p")[2].css("a")[0]),
        :release_date => card.css("h3 .lister-item-year").text,
        :rating => card.css(".certificate").text,
        :runtime => card.css(".runtime").text,
        :genre => card.css(".genre").text.strip,
        :metascore => card.css(".metascore").text.strip,
        :description => card.css("p")[1].text.strip
        }
    end
    movie_array #array of movies organized into hashes
  end

end
