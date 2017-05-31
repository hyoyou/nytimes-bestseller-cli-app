class Category
  attr_accessor :name, :books

  @@all = []

  def initialize(name, book_attributes)
    @name = name

    @books = book_attributes.collect do |book_attribute|
      Book.new(self, book_attribute)
    end

    @@all << self
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
