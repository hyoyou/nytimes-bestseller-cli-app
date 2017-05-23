class NytBestsellerCliApp::Category
  attr_accessor :name, :url

  def self.all
    #I should return a bunch of instances of Category
    #puts <<-DOC.gsub /^\s*/, ''
    #  1. Combined Print & E-Book Fiction
    #  2. Hardcover Fiction
    #  3. Combined Print & E-Book Nonfiction
    #  4. Hardcover Nonfiction
    #  5. Paperback Nonfiction
    #DOC

    category_1 = self.new
    category_1.name = "Combined Print & E-Book Fiction"
    category_1.url = "https://www.nytimes.com/books/best-sellers/combined-print-and-e-book-fiction/"

    category_2 = self.new
    category_2.name = "Hardcover Fiction"
    category_2.url = "https://www.nytimes.com/books/best-sellers/hardcover-fiction/"

    category_3 = self.new
    category_3.name = "Combined Print & E-Book Nonfiction"
    category_3.url = "https://www.nytimes.com/books/best-sellers/combined-print-and-e-book-nonfiction/"

    category_4 = self.new
    category_4.name = "Hardcover Nonfiction"
    category_4.url = "https://www.nytimes.com/books/best-sellers/hardcover-nonfiction/"

    category_5 = self.new
    category_5.name = "Paperback Nonfiction"
    category_5.url = "https://www.nytimes.com/books/best-sellers/paperback-nonfiction"

    [category_1, category_2, category_3, category_4, category_5]
  end

end
