require 'rails_helper'

RSpec.describe Medium, type: :model do
  let(:medium) { create :medium }
  let(:medium2) { create :medium }
  let(:article) { create :article }
  let(:articles) { create_list :article, 10 }

  describe '#articles' do
    it 'gets approved articles by default' do
      medium.articles << articles
      expect(medium.articles.count).to eql 10
      expect(medium.articles.approved.count).to eql 10
    end

    it 'gets banned articles by given status' do
      medium.ban_article article
      expect(medium.articles.banned.count).to eql 1
    end

    it 'keeps 0 approved if other media has approved articles' do
      medium.articles << articles
      expect(medium2.articles.count).to eql 0
    end
  end
end
