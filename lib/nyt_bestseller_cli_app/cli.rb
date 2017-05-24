#Our CLI Controller
class NytBestsellerCliApp::CLI

  def call
    list_categories
    menu
    #goodbye
  end

  def list_categories
    puts "This week's Best Selling Books:"
    @categories = NytBestsellerCliApp::Category.all
    @categories.each.with_index(1) do |category, i|
      puts "#{i}. #{category.name}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the category you would like to see the top 15 books for or type list to see the categories again or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        categories = @categories[input.to_i-1]
        puts "#{categories.name}"
      elsif input == "list"
        list_categories
      elsif input == "exit"
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
