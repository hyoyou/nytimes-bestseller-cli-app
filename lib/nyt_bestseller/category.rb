class NytBestseller::Category
  attr_accessor :name, :url

  def self.all
    #It should return a bunch of instances of Category
    self.scrape_categories
  end

  def self.scrape_categories
    doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/the-new-york-times-bestsellers/_/N-1p3n"))
    categories = []

    i = 1
    while i < 6
      doc.css("#hotBooksWithDesc > h2").each do |c|
        categories << "#{i}. " + "#{c.text}"
        i += 1
      end
    end
    categories
  end

end
