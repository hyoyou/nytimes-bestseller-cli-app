class NytBestsellerCliApp::Category
  attr_accessor :name, :url

  def self.all
    #It should return a bunch of instances of Category
    self.scrape_categories
  end

  def self.scrape_categories
    categories = []

    categories << self.scrape_cat1
    categories << self.scrape_cat2
    categories << self.scrape_cat3
    categories << self.scrape_cat4

    category_1 = self.new
    category_1.name = "Hardcover Fiction"
    category_1.url = "http://www.barnesandnoble.com/b/new-york-times-bestsellers-hardcover-fiction/_/N-1p3r"

    category_2 = self.new
    category_2.name = "Hardcover Nonfiction"
    category_2.url = "http://www.barnesandnoble.com/b/new-york-times-bestsellers-hardcover-nonfiction/_/N-1p5q"

    category_3 = self.new
    category_3.name = "Paperback Fiction"
    category_3.url = "http://www.barnesandnoble.com/b/new-york-times-bestsellers-trade-paperback-fiction/_/N-1p3v"

    category_4 = self.new
    category_4.name = "Paperback Nonfiction"
    category_4.url = "http://www.barnesandnoble.com/b/new-york-times-bestsellers-paperback-nonfiction/_/N-1p3u"

    [category_1, category_2, category_3, category_4]
  end

  def self.scrape_cat1
    doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/new-york-times-bestsellers-hardcover-fiction/_/N-1p3r"))

    name = doc.css(".html-embed-container").first.text.strip
    puts "Top 15 Books in #{name}:"

    i = 1
    while i < 16
      listview = doc.css("#listView > li:nth-child(#{i}) > ul > li > div.product-info")
      puts "#{i}. " + "#{listview.css("p.product-info-title > a").text} by: " + "#{listview.css("span > a").first.text}"
      i += 1
    end
  end

  def self.scrape_cat2
    doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/new-york-times-bestsellers-hardcover-nonfiction/_/N-1p5q"))

    name = doc.css(".html-embed-container").first.text.strip
    puts "Top 15 Books in #{name}:"

    i = 1
    while i < 16
      listview = doc.css("#listView > li:nth-child(#{i}) > ul > li > div.product-info")
      puts "#{i}. " + "#{listview.css("p.product-info-title > a").text} by: " + "#{listview.css("span > a").first.text}"
      i += 1
    end
  end

  def self.scrape_cat3
    doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/new-york-times-bestsellers-trade-paperback-fiction/_/N-1p3v"))

    name = doc.css(".html-embed-container").first.text.strip
    puts "Top 10 Books in #{name}:"

    i = 1
    while i < 11
      listview = doc.css("#listView > li:nth-child(#{i}) > ul > li > div.product-info")
      puts "#{i}. " + "#{listview.css("p.product-info-title > a").text} by: " + "#{listview.css("span > a").first.text}"
      i += 1
    end
  end

  def self.scrape_cat4
    doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/new-york-times-bestsellers-paperback-nonfiction/_/N-1p3u"))

    name = doc.css(".html-embed-container").first.text.strip
    puts "Top 10 Books in #{name}:"

    i = 1
    while i < 11
      listview = doc.css("#listView > li:nth-child(#{i}) > ul > li > div.product-info")
      puts "#{i}. " + "#{listview.css("p.product-info-title > a").text} by: " + "#{listview.css("span > a").first.text}"
      i += 1
    end
  end

end
