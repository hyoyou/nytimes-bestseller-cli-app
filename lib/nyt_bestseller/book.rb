class NytBestseller::Book
  attr_accessor :title, :author, :release_date, :rating, :url
  #instantiates individual books
  @@all = []


  def initialize(url=nil, title=nil, author=nil, summary=nil)
    @title = title
    @author = author
    @summary = summary
    self.all << self
  end

  doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/the-new-york-times-bestsellers/_/N-1p3n"))
  binding.pry
  #list = doc.css("#listView > li:nth-child(#{i}) > ul > li > div.product-info")
  #hotBooksWithDesc > div.caroufredsel_wrapper
#book-carousel-1
  def self_new_from_webpage(input)
    self.new(
      #"http://www.barnesandnoble.com/#{#listView > li:nth-child(#{input}) > ul > li > div.product-info > p.product-info-title > a
      #title
      #author
      #summary
    )
  end

  def self.all
    @@all
  end

  def title
    @title ||= listview.css("p.product-info-title > a").text
  end

  def author
    @author ||= listview.css("span > a").first.text
  end

  def release_date
    @release_date ||= nil
  end

  def rating
    @rating ||= nil
  end

  def self.find(input)

  end

  #doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/new-york-times-bestsellers-hardcover-fiction/_/N-1p3r"))

  #name = doc.css(".html-embed-container").first.text.strip
  #puts "Top 15 Books in #{name}:"

  #i = 1
  #while i < 16
  #  listview = doc.css("#listView > li:nth-child(#{i}) > ul > li > div.product-info")
  #  puts "#{i}. " + "#{listview.css("p.product-info-title > a").text} by: " + "#{listview.css("span > a").first.text}"
  #  i += 1
  #end

end
