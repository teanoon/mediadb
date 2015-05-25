require 'rails_helper'

RSpec.describe Crawler::MeishichinaEat do
  let(:list) { 'http://www.meishichina.com/Eat/Drink/' }
  let(:article) { 'http://www.meishichina.com/Eat/Drink/201409/128097.html' }
  let(:crawler) { Crawler::MeishichinaEat.new list }

  describe '#get_articles' do
    it ''
  end

  describe '#get_article_links' do
    it 'gets links array', :vcr do
      crawler.page = crawler.agent.get list
      expect(crawler.get_article_links).to be_any
    end
  end

  describe '#get_next_list_link' do
    it 'is the next list', :vcr do
      crawler.page = crawler.agent.get list
      expect(crawler.get_next_list_link).to match /^http/
    end
  end

  describe '#get_article' do
    it 'gets article model', :vcr do
      expect(crawler.get_article article).to eql 1
    end
  end

  describe '#get_text_with_img' do
    it 'replace img with src' do
      expect('<br><img src="good">'.gsub(/<img.+src=\"(.+)\".?>/, '\1')).to eql '<br>good'
    end
  end
end