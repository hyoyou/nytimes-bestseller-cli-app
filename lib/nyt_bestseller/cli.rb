#Our CLI Controller
class NytBestseller::CLI
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
    @categories = NytBestseller::Category.all
    @categories.each.with_index(1) do |category, i|
      puts "     #{i}. #{category.name}"
    end
  end

  def list_books
    puts ""
    puts "What book would you like more information on?"
    input = gets.strip
    book = NytBestseller::Book.find(input.to_i)

    puts ""
    puts "Would you like to see the list again? Enter Y or N"
    input = gets.strip.upcase
    if input == "Y"
      menu
    else
      input == "exit"
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
      NytBestseller::Chart.scrape_cat1
      list_books
    when "2"
      NytBestseller::Chart.scrape_cat2
      list_books
    when "3"
      NytBestseller::Chart.scrape_cat3
      list_books
    when "4"
      NytBestseller::Chart.scrape_cat4
      list_books
    when "list"
      list_categories
    when "exit"
      goodbye
    else
      puts "Please check your input!"
    end

  end

  def goodbye
    puts "See you next week!"
  end
end
