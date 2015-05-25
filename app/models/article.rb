class Article < ActiveRecord::Base
  has_and_belongs_to_many :medium
  has_many :articles_media

  scope :approved, -> { where( articles_media: { status: ArticlesMedium.statuses[:approved] } ) }
  scope :banned, -> { where( articles_media: { status: ArticlesMedium.statuses[:banned] } ) }

  def self.is_duplicated url
    find_by_url(url).present?
  end
end
