class Medium < ActiveRecord::Base
  enum media_type: [:wechat, :weibo]

  has_many :articles, through: :articles_media
  has_many :articles_media
  belongs_to :user

  def change_article article, status
    status_code = ArticlesMedium.statuses[status.to_sym]
    article_medium = ArticlesMedium.find_or_create_by(
      medium_id: id,
      article_id: article.try(:id)
    )

    article_medium.update_attributes status: status_code
  end

  def add_article article
    change_article article, :approved
  end

  def ban_article article
    change_article article, :banned
  end

  def send_article article
    change_article article, :sent
  end
end
