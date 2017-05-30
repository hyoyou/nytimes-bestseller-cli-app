require 'pry'

class Scraper
  attr_accessor :input, :book, :url, :doc


  def scrape_categories
    doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/the-new-york-times-bestsellers/_/N-1p3n"))

    doc.css("#hotBooksWithDesc > h2").collect do |category|
      category.text
    end
  end

  def top_ten(doc)
    name = doc.css(".html-embed-container").first.text.strip
    puts ""
    puts "Top 10 Books in #{name}:"

    i = 1
    while i < 11
      listview = @doc.css("#listView > li:nth-child(#{i}) > ul > li > div.product-info")
      puts "     #{i}. " + "#{listview.css("p.product-info-title > a").text} by: " + "#{listview.css("span > a").first.text}"
      i += 1
    end
  end

  def get_input
    puts ""
    puts "Please type the number of the book you would like more information on:"
    @input = gets.strip
    @book = @input.to_i
  end

  def get_book
    url = "https://www.barnesandnoble.com#{@doc.css("#listView > li:nth-child(#{@book}) > ul > li > div.product-image > a:nth-child(1)").attribute("href").value}"
    book_info = Nokogiri::HTML(open("#{url}"))
    title = book_info.css("#prodSummary > h1").text
    author = book_info.css("#prodSummary > span > a").first.text
    summary = book_info.css("#productInfoOverview > div > div > p:nth-child(3)").text.strip
    puts ""
    puts "-------------------------------------------------------"
    puts "TITLE:       #{title}"
    puts "AUTHOR:      #{author}"
    puts ""
    puts "SYNOPSIS:    #{summary}"
  end


  def scrape_cat1 #Hardcover Fiction
    @doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/new-york-times-bestsellers-hardcover-fiction/_/N-1p3r"))
    top_ten(@doc)
    get_input
    get_book
  end

  def scrape_cat2 #Harcover Nonfiction
    @doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/new-york-times-bestsellers-hardcover-nonfiction/_/N-1p5q"))
    top_ten(@doc)
    get_input
    get_book
  end

  def scrape_cat3 #Paperback Fiction
    @doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/new-york-times-bestsellers-trade-paperback-fiction/_/N-1p3v"))
    top_ten(@doc)
    get_input
    get_book
  end

  def scrape_cat4 #Paperback Nonfiction
    @doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/new-york-times-bestsellers-paperback-nonfiction/_/N-1p3u"))
    top_ten(@doc)
    get_input
    get_book
  end

  def scrape_cat5 #Advice and How-To
    @doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/new-york-times-bestsellers-advice-how-to-miscellaneous/_/N-1p3o"))
    top_ten(@doc)
    get_input
    get_book
  end


end
