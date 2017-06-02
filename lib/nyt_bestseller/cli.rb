class CLI
  def call
    puts "           .--.                    .---."
    puts "       .---|__|    .-.     .-.     |~~~|"
    puts "    .--|===|--|_   |_|     |_|     |~~~|--."
    puts "    |  |===|  |.---!~|_.---!~|  .--|   |--|"
    puts "    |%%|   |  ||===| | |===| |--|%%|   |  |"
    puts "    |%%|   |  ||   | | |   | |__|  |   |  |"
    puts "    |  |   |  ||===| | |===| |==|  |   |  |"
    puts "    |  |   |__||===| | |===| |__|  |~~~|__|"
    puts "    |  |===|--||===|~| |===|~|--|%%|~~~|--|"
    puts "    ^--^---'--^ ---^-'-`---^-^--^--^---'--'"
    puts "Welcome to the New York Times Best Seller List!"
    puts ""
    puts "Retrieving this week's best seller list:"
    hfict = Category.new("Hardcover Fiction", Scraper.scrape_hfict)
    hnonfict = Category.new("Hardcover Nonfiction", Scraper.scrape_hnonfict)
    pfict = Category.new("Paperback Fiction", Scraper.scrape_pfict)
    pnonfict = Category.new("Paperback Nonfiction", Scraper.scrape_pnonfict)
    advice = Category.new("Advice, How-To and Miscellaneous", Scraper.scrape_advice)
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
    puts "Enter the number of the category you would like to see or type 'exit':"

    @input = gets.strip.upcase

    if @input.to_i.between?(1, Category.all.count)
      books_by_category
    elsif @input == "EXIT"
      goodbye
    else
      puts "Please check your input!"
      menu
    end
  end

  def books_by_category
    @the_category = Category.find(@input)

    puts ""
    puts "Top Books in #{@the_category.name}:"

    @the_category.books.each.with_index(1) do |book, index|
      puts "     #{index}. #{book.title}  by  #{book.author}"
    end
    show_book
  end

  def show_book
    puts ""
    puts "Please type the number of the book you would like more information on:"

    @book_input = gets.strip
    book = @the_category.find_book(@book_input)

    puts ""
    puts "-------------------------------------------------------"
    puts "TITLE:       #{book.title}"
    puts "AUTHOR:      #{book.author}"
    puts ""
    puts "SYNOPSIS:    #{book.summary}"

    puts ""
    puts "Would you like to view this book on the B&N website? Enter Y / N"
    @browser_input = gets.strip.upcase

    if @browser_input == "Y"
      book.open_in_browser
    end

    puts "Would you like to see another book? Enter Y / N, or type 'list' to go back to the categories:"
    @final_input = gets.strip.upcase

    if @final_input == "Y"
      show_book
    elsif @final_input == "LIST"
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
