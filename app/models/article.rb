class Article < ActiveRecord::Base
  has_many :media, through: :articles_media
  has_many :articles_media

  scope :audit, -> { where( articles_media: { status: ArticlesMedium.statuses[:audit] } ) }
  scope :approved, -> { where( articles_media: { status: ArticlesMedium.statuses[:approved] } ) }
  scope :banned, -> { where( articles_media: { status: ArticlesMedium.statuses[:banned] } ) }

  def self.all_with_media_info
    joins("LEFT JOIN `articles_media` as `am` ON `am`.article_id = `articles`.id")
    .select("`articles`.*, `am`.medium_id AS medium_id")
  end

  def self.is_duplicated url
    find_by_url(url).present?
  end
end
