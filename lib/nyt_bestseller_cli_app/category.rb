class NytBestsellerCliApp::Category
  attr_accessor :name, :url

  def self.all
    #It should return a bunch of instances of Category
    self.scrape_categories
  end

  def self.scrape_categories
    #since categories don't change, may not need to actually scrape it.
    categories = []

    category_1 = self.new
    category_1.name = "Hardcover Fiction"
    categories << category_1.name
    #category_1.url = "http://www.barnesandnoble.com/b/new-york-times-bestsellers-hardcover-fiction/_/N-1p3r"

    category_2 = self.new
    category_2.name = "Hardcover Nonfiction"
    categories << category_2.name
    #category_2.url = "http://www.barnesandnoble.com/b/new-york-times-bestsellers-hardcover-nonfiction/_/N-1p5q"

    category_3 = self.new
    category_3.name = "Paperback Fiction"
    categories << category_3.name
    #category_3.url = "http://www.barnesandnoble.com/b/new-york-times-bestsellers-trade-paperback-fiction/_/N-1p3v"

    category_4 = self.new
    category_4.name = "Paperback Nonfiction"
    categories << category_4.name
    #category_4.url = "http://www.barnesandnoble.com/b/new-york-times-bestsellers-paperback-nonfiction/_/N-1p3u"

    [category_1, category_2, category_3, category_4]
  end

end
