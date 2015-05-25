module Crawler
  class MeishichinaEat < Base
    def get_article_links
      @page.links.select{ |l| l.href =~ /Eat\/Drink\/\w+\/.+\.html/ && l.text.present? }
      .map{ |l| get_full_url l.href }
    end

    def get_next_list_link
      href = @page.link_with(href: /Eat\/\w+\/List_\d+\.html/, text: '下一页').href
      get_full_url href
    end

    def get_article link
      page = super(link)
      link_dom = page.link_with(href: /163.+?blog\/static/)
      final_page = link_dom && @agent.get(link_dom.href)
      if final_page
        {
          url: link,
          title: get_title(final_page),
          content: get_text_with_img(final_page)
        }
      else
        {}
      end
    end

    def get_title page
      page.search('#blog-163-com-container h3.title').text.strip
    end

    def get_text_with_img page
      page.search('#blog-163-com-container .nbw-blog').to_s
      .gsub(/<img.+src=\"(.+)\".?>/, '\1')
      .gsub(/<.+?>/, '<br>')
    end
  end
end