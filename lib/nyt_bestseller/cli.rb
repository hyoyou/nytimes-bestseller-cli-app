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
    @categories = Category.all
    @categories.each.with_index(1) do |category, index|
      puts "     #{index}. #{category}"
    end
  end

  def list_books
    puts ""
    puts "Would you like to see another book or go back to the categories? Enter Y / N / list:"
    input = gets.strip.upcase
    if input == "Y"
      Scraper.new.all
      Scraper.new.get_input
      Scraper.new.get_book
      list_books
    elsif input == "LIST"
      list_categories
      menu
    else
      goodbye
    end
  end

  def menu
    input = nil

    puts ""
    puts "Enter the number of the category you would like to see or type exit."
    puts "You may also type list to see the list again:"
    input = gets.strip.downcase

    case input
    when "1"
      Scraper.new.scrape_cat1
      list_books
    when "2"
      Scraper.new.scrape_cat2
      list_books
    when "3"
      Scraper.new.scrape_cat3
      list_books
    when "4"
      Scraper.new.scrape_cat4
      list_books
    when "5"
      Scraper.new.scrape_cat4
      list_books
    when "list"
      list_categories
      menu
    when "exit"
      goodbye
    else
      puts "Please check your input!"
    end

  end

  def goodbye
    puts ""
    puts "Come back next week for an updated list!"
  end
end
