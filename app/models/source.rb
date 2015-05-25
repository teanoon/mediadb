class Source < ActiveRecord::Base
  def create_articles
    crawler = "Crawler::#{name}".classify.constantize.new(url)
    crawler.get_articles
  end
end
