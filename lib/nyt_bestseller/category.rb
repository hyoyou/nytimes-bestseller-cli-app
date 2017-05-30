require 'pry'

class Category

  def self.all
    Scraper.scrape_categories
    binding.pry
  end

  def self.print_all
    @categories = self.all
    @categories.each.with_index(1) do |category, index|
      puts "     #{index}. #{category}"
    end
  end
end
