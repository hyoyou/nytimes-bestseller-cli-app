#Our CLI Controller
class NytBestsellerCliApp::CLI

  def call
    puts "This week's Best Selling Books:"
    list_categories
  end

  def list_categories
    puts <<-DOC.gsub /^\s*/, ''
      1. Combined Print & E-Book Fiction
      2. Hardcover Fiction
      3. Combined Print & E-Book Nonfiction
      4. Hardcover Nonfiction
      5. Paperback Nonfiction
    DOC
  end

end
