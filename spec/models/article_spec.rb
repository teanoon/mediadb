require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '.all_with_media_info' do
    before(:all) do
      article = create :article
      @medium = create :medium
      article.media << @medium
    end

    it 'gets articles with medium_id attribute' do
      expect(Article.all_with_media_info.first.medium_id).to eql @medium.id
    end

    it 'gets all articles' do
      create :article
      expect(Article.all_with_media_info.size).to eql 2
    end
  end
end
