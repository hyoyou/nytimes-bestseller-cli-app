class Category

  def self.all
    Scraper.scrape_categories
  end
end
