class NytBestsellerCliApp::Category

  def self.all
    #I should return a bunch of instances of Category
    puts <<-DOC.gsub /^\s*/, ''
      1. Combined Print & E-Book Fiction
      2. Hardcover Fiction
      3. Combined Print & E-Book Nonfiction
      4. Hardcover Nonfiction
      5. Paperback Nonfiction
    DOC
  end

end
