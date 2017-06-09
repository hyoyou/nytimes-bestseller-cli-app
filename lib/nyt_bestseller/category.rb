class Category
  attr_accessor :name, :books

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def scrape_books
    if name == "Hardcover Fiction"
      @books = Scraper.scrape_hfict.collect do |book_attributes|
        Book.new(self, book_attributes)
      end
    elsif name == "Hardcover Nonfiction"
      @books = Scraper.scrape_hnonfict.collect do |book_attributes|
        Book.new(self, book_attributes)
      end
    elsif name == "Paperback Fiction"
      @books = Scraper.scrape_pfict.collect do |book_attributes|
        Book.new(self, book_attributes)
      end
    elsif name == "Paperback Nonfiction"
      @books = Scraper.scrape_pnonfict.collect do |book_attributes|
        Book.new(self, book_attributes)
      end
    else
      @books = Scraper.scrape_advice.collect do |book_attributes|
        Book.new(self, book_attributes)
      end
    end
  end

  def self.all
    @@all
  end

  def self.print_all
    @@all.each.with_index(1) do |category, index|
      puts "     #{index}. #{category.name}"
    end
  end

  def self.find(id)
    @@all[id.to_i-1]
  end

  def find_book(id)
    self.books[id.to_i-1]
  end
end
