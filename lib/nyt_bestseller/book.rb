class Book
  attr_accessor :url, :title, :author, :summary, :category

  @@all = []

  def initialize(category, attributes)
    @category = category

    attributes.each do |book_key, book_value|
      self.send("#{book_key}=", "#{book_value}")
    end

    @@all << self
  end

  def self.all
    @@all
  end

  def open_in_browser
    system("open '#{url}'")
  end
end
