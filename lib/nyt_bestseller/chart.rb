class NytBestseller::Chart
  #NytBestsellerCliApp::Chart belongs to NytBestsellerCliApp::Category

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
