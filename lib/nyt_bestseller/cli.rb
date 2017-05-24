#Our CLI Controller
class NytBestseller::CLI

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

  def menu
    input = nil
    while input != "exit"
      puts ""
      puts "Enter the number of the category you would like to see or type exit."
      puts "You may also type list to see the list again:"
      input = gets.strip.downcase
      case input
      when "1"
        categories = @categories[input.to_i-1]
        puts "#{categories.name}"
      when "2"
        categories = @categories[input.to_i-1]
        puts "#{categories.name}"
      when "3"
        categories = @categories[input.to_i-1]
        puts "#{categories.name}"
      when "4"
        categories = @categories[input.to_i-1]
        puts "#{categories.name}"
      when "list"
        list_categories
      when "exit"
        goodbye
      else
        puts "Please check your input!"
      end
    end
  end

  def goodbye
    puts "See you next week!"
  end
end
