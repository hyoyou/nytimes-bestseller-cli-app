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

  def self.print_all
    @@all.each.with_index(1) do |book, index|
      puts "     #{index}.  #{book.title}  by  #{book.author}"
    end
  end
end
