class CLI
  attr_accessor :chart

  def call
    puts "Welcome to the NYTimes Bestseller List"
    puts ""
    puts "Which format and genre of books would you like to see the bestseller list for?"
    list_categories
    menu
  end

  def list_categories
    puts ""
    Category.print_all
  end

  def menu
    puts ""
    puts "Enter the number of the category you would like to see or type exit."
    puts "You may also type list to see the list again:"

    @input = gets.strip.downcase

    if input.to_i.between?(1, Category.all.count)
      show_books
    #when "1"
    #  Scraper.scrape_cat1
    #  list_books
    #when "2"
    #  Scraper.scrape_cat2
    #  list_books
    #when "3"
    #  Scraper.scrape_cat3
    #  list_books
    #when "4"
    #  Scraper.scrape_cat4
    #  list_books
    #when "5"
    #  Scraper.scrape_cat5
    #  list_books
    elsif input == "list"
      list_categories
      menu
    elsif input == "exit"
      goodbye
    else
      puts "Please check your input!"
      menu
    end
  end

  def show_books
    selected_category = Category.find(@input)

    selected_category.books.each.with_index(1) do |book, index|
      puts "     #{index}. #{book.title}  by: #{book.author}"
    end

    puts ""
    puts "Please type the number of the book you would like more information on:"
    @book_input = gets.strip
    @book = @book_input.to_i

    book = selected_category.find_book(@book_input)
    puts ""
    puts "-------------------------------------------------------"
    puts "TITLE:       #{book.title}"
    puts "AUTHOR:      #{book.author}"
    puts ""
    puts "SYNOPSIS:    #{book.summary}"
  end

  def list_books
    puts ""
    puts "Would you like to see another book? Enter Y / N, or type 'list' to go back to the categories:"
    input = gets.strip.upcase
    if input == "Y"
      Scraper.get_input
      Scraper.get_book
      list_books
    elsif input == "LIST"
      list_categories
      menu
    else
      goodbye
    end
  end

  def goodbye
    puts ""
    puts "Come back for an updated list next week!"
  end
end
