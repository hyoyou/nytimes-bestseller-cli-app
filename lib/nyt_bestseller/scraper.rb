require 'pry'

class Scraper
  attr_accessor :input, :book, :url, :doc


  def self.scrape_categories
    doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/the-new-york-times-bestsellers/_/N-1p3n"))

    doc.css("#hotBooksWithDesc > h2").collect do |category|
      category.text
    end
  end

  def self.top_ten(doc)
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

  def self.get_input
    puts ""
    puts "Please type the number of the book you would like more information on:"
    @input = gets.strip
    @book = @input.to_i
  end

  def self.get_book
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


  def self.scrape_hfict #Hardcover Fiction
    hfict = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/new-york-times-bestsellers-hardcover-fiction/_/N-1p3r"))
    count = 1
    while count < 11
      hfict.css("div.product-info").collect do |book|
        book_info = {
          :url => "https://www.barnesandnoble.com#{hfict.css("#listView > li:nth-child(#{count}) > ul > li > div.product-image > a:nth-child(1)").attribute("href").value}"
        }

        book_page = Nokogiri::HTML (open(book_info[:url]))
        book_info[:title] = book_page.css("#prodSummary > h1").text
        book_info[:author] = book_page.css("#prodSummary > span > a").first.text
        book_info[:summary] = book_page.css("#productInfoOverview > div > div > p:nth-child(3)").text.strip

        book_info
        count += 1
      end
      binding.pry
    end
    get_input
    get_book
  end

  def self.scrape_hnonfict #Harcover Nonfiction
    @doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/new-york-times-bestsellers-hardcover-nonfiction/_/N-1p5q"))
    top_ten(@doc)
    get_input
    get_book
  end

  def self.scrape_pfict #Paperback Fiction
    @doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/new-york-times-bestsellers-trade-paperback-fiction/_/N-1p3v"))
    top_ten(@doc)
    get_input
    get_book
  end

  def self.scrape_pnonfict #Paperback Nonfiction
    @doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/new-york-times-bestsellers-paperback-nonfiction/_/N-1p3u"))
    top_ten(@doc)
    get_input
    get_book
  end

  def self.scrape_advice #Advice and How-To
    @doc = Nokogiri::HTML(open("https://www.barnesandnoble.com/b/new-york-times-bestsellers-advice-how-to-miscellaneous/_/N-1p3o"))
    top_ten(@doc)
    get_input
    get_book
  end
end
