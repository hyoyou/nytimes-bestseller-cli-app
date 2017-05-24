class NytBestseller::Book
  attr_accessor :title, :author, :summary, :url
  #instantiates individual books
  @@all = []

  def initialize(title=nil, author=nil, summary=nil)
    @title = title
    @author = author
    @summary = summary
    self.all << self
  end

  def self.all
    @@all
  end

  def title
    @title ||= listview.css("p.product-info-title > a").text
  end

  def author
    @author ||= listview.css("span > a").first.text
  end

  def summary
    @summary ||= nil
  end

end
