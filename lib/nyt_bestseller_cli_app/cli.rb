#Our CLI Controller
class NytBestsellerCliApp::CLI

  def call
    list_categories
    menu
  end

  def list_categories
    puts "This week's Best Selling Books:"
    puts <<-DOC.gsub /^\s*/, ''
      1. Combined Print & E-Book Fiction
      2. Hardcover Fiction
      3. Combined Print & E-Book Nonfiction
      4. Hardcover Nonfiction
      5. Paperback Nonfiction
    DOC
  end

  def menu
    puts "Enter the number of the category you would like to see the top 15 books for:"
  end
end
