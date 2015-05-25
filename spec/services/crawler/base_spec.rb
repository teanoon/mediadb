require 'rails_helper'

RSpec.describe Crawler::Base do
  let(:crawler) { Crawler::Base.new 'http://www.meishichina.com/Eat/Drink/' }

  describe '#get_articles' do
    it ''
  end

  describe '#get_article_links' do
    it 'is empty' do
      expect(crawler.get_article_links).to be_empty
    end
  end

  describe '#get_next_list_link' do
    it 'is nil' do
      expect(crawler.get_next_list_link).to be_nil
    end
  end

  describe '#get_article'
end
