#Our CLI Controller
class NytBestsellerCliApp::CLI

  def call
    list_categories
    menu
    goodbye
  end

  def list_categories
    puts "This week's Best Selling Books:"
    @categories = NytBestsellerCliApp::Category.all
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the category you would like to see the top 15 books for or type list to see the categories again or type exit:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "Retrieving best seller list for Combined Print & E-Book Fiction"
      when "2"
        puts "Retrieving best seller list for Hardcover Fiction"
      when "3"
        puts "Retrieving best seller list for Combined Print & E-Book Nonfiction"
      when "4"
        puts "Retrieving best seller list for Hardcover Nonfiction"
      when "5"
        puts "Retrieving best seller list for Paperback Nonfiction"
      when "list"
        list_categories
      else
        puts "Please check your input!"
      end
    end
  end

  def goodbye
    puts "See you next week!"
  end
end
