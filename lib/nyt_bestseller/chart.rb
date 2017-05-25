class NytBestseller::Chart

  def self.top_ten(doc)
    name = doc.css(".html-embed-container").first.text.strip
    puts ""
    puts "Top 10 Books in #{name}:"

    i = 1
    while i < 11
      listview = doc.css("#listView > li:nth-child(#{i}) > ul > li > div.product-info")
      puts "     #{i}. " + "#{listview.css("p.product-info-title > a").text} by: " + "#{listview.css("span > a").first.text}"
      i += 1
    end
  end

  def self.scrape_cat1 #Hardcover Fiction
    doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/new-york-times-bestsellers-hardcover-fiction/_/N-1p3r"))
    top_ten(doc)
  end

  def self.scrape_cat2 #Harcover Nonfiction
    doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/new-york-times-bestsellers-hardcover-nonfiction/_/N-1p5q"))
    top_ten(doc)
  end

  def self.scrape_cat3 #Paperback Fiction
    doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/new-york-times-bestsellers-trade-paperback-fiction/_/N-1p3v"))
    top_ten(doc)
  end

  def self.scrape_cat4 #Paperback Nonfiction
    doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/new-york-times-bestsellers-paperback-nonfiction/_/N-1p3u"))
    top_ten(doc)
  end

  def self.scrape_cat5 #Advice and How-To
    doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/new-york-times-bestsellers-advice-how-to-miscellaneous/_/N-1p3o"))
    top_ten(doc)
  end
end
