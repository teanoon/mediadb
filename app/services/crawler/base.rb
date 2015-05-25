module Crawler
  class Base
    attr_accessor :page, :agent

    def initialize url
      @host = URI.parse( url ).host
      @list = url
      @agent = Mechanize.new
    end

    def get_full_url url
      if url =~ /^http/
        url
      else
        'http://' + @host + '/' + url.gsub(/^\//, '')
      end
    end

    def get_articles
      page_num = 1
      while page_num > 0 && @list.present? do
        @page = @agent.get @list
        get_article_links.each do |link|
          article = get_article(link)
          Article.create article unless(Article.is_duplicated(link) || article.empty?)
        end

        @list = get_next_list_link
        page_num -= 1
      end
    end

    def get_article_links
      []
    end

    def get_next_list_link
      nil
    end

    def get_article link
      @agent.get link
    end

    def get_title page
      ''
    end

    def get_text_with_img page
      ''
    end
  end
end