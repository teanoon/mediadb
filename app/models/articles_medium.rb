class ArticlesMedium < ActiveRecord::Base
  enum status: [:approved, :sent, :banned]
  belongs_to :article

  before_save :set_default_status

  def set_default_status
    status ||= self.class.statuses[:approved]
  end
end
