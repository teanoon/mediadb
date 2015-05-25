class Medium < ActiveRecord::Base
  enum media_type: [:wechat, :weibo]

  has_and_belongs_to_many :articles
  belongs_to :user

  def change_article article, status
    status_code = ArticlesMedium.statuses[status.to_sym]
    article = ArticlesMedium.find_or_create_by(
      medium_id: id,
      article_id: (article.try(:id) || article)
    )

    article.update_attributes status: status_code
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
