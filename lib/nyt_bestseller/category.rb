class Category
  attr_accessor :name, :books

  @@all = []

  def initialize(name, book_array)
    @name = name

    @books = book_array.collect do |book_attributes|
      Book.new(self, book_attributes)
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
