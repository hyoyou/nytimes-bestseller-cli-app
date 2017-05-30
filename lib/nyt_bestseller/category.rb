class Category

  def self.all
    Scraper.new.scrape_categories
  end
end
