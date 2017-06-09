class Scraper
  def self.scrape_hfict #Hardcover Fiction
    hfict = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/new-york-times-bestsellers-hardcover-fiction/_/N-1p3r", :allow_redirections => :all))

    hfict.css("div.product-info").collect.with_index(1) do |book, i|
      book_info = {
        :url => "http://www.barnesandnoble.com#{hfict.css("#listView > li:nth-child(#{i}) > ul > li > div.product-image > a:nth-child(1)").attribute("href").value}"
      }

      book_page = Nokogiri::HTML (open(book_info[:url], :allow_redirections => :all))
      book_info[:title] = book_page.css("h1").text
      book_info[:author] = book_page.css("span > a").first.text
      book_info[:summary] = book_page.css(".flexColumn").text.strip

      book_info
    end
  end

  def self.scrape_hnonfict #Hardcover Nonfiction
    hnonfict = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/new-york-times-bestsellers-hardcover-nonfiction/_/N-1p5q", :allow_redirections => :all))

    hnonfict.css("div.product-info").collect.with_index(1) do |book, i|
      book_info = {
        :url => "http://www.barnesandnoble.com#{hnonfict.css("#listView > li:nth-child(#{i}) > ul > li > div.product-image > a:nth-child(1)").attribute("href").value}"
      }

      book_page = Nokogiri::HTML (open(book_info[:url], :allow_redirections => :all))
      book_info[:title] = book_page.css("h1").text
      book_info[:author] = book_page.css("span > a").first.text
      book_info[:summary] = book_page.css(".flexColumn").text.strip

      book_info
    end
  end

  def self.scrape_pfict #Paperback Fiction
    pfict = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/new-york-times-bestsellers-trade-paperback-fiction/_/N-1p3v", :allow_redirections => :all))

    pfict.css("div.product-info").collect.with_index(1) do |book, i|
      book_info = {
        :url => "http://www.barnesandnoble.com#{pfict.css("#listView > li:nth-child(#{i}) > ul > li > div.product-image > a:nth-child(1)").attribute("href").value}"
      }

      book_page = Nokogiri::HTML (open(book_info[:url], :allow_redirections => :all))
      book_info[:title] = book_page.css("h1").text
      book_info[:author] = book_page.css("span > a").first.text
      book_info[:summary] = book_page.css(".flexColumn").text.strip

      book_info
    end
  end

  def self.scrape_pnonfict #Paperback Nonfiction
    pnonfict = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/new-york-times-bestsellers-paperback-nonfiction/_/N-1p3u", :allow_redirections => :all))

    pnonfict.css("div.product-info").collect.with_index(1) do |book, i|
      book_info = {
        :url => "http://www.barnesandnoble.com#{pnonfict.css("#listView > li:nth-child(#{i}) > ul > li > div.product-image > a:nth-child(1)").attribute("href").value}"
      }

      book_page = Nokogiri::HTML (open(book_info[:url], :allow_redirections => :all))
      book_info[:title] = book_page.css("h1").text
      book_info[:author] = book_page.css("span > a").first.text
      book_info[:summary] = book_page.css(".flexColumn").text.strip

      book_info
    end
  end

  def self.scrape_advice #Advice and How-To
    advice = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/new-york-times-bestsellers-advice-how-to-miscellaneous/_/N-1p3o", :allow_redirections => :all))

    advice.css("div.product-info").collect.with_index(1) do |book, i|
      book_info = {
        :url => "http://www.barnesandnoble.com#{advice.css("#listView > li:nth-child(#{i}) > ul > li > div.product-image > a:nth-child(1)").attribute("href").value}"
      }

      book_page = Nokogiri::HTML (open(book_info[:url], :allow_redirections => :all))
      book_info[:title] = book_page.css("h1").text
      book_info[:author] = book_page.css("span > a").first.text
      book_info[:summary] = book_page.css(".flexColumn").text.strip

      book_info
    end
  end

end
