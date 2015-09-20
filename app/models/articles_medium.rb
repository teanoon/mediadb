class ArticlesMedium < ActiveRecord::Base
  enum status: [:audit, :approved, :sent, :banned]
  
  belongs_to :article
  belongs_to :medium

  before_save :set_default_status

  def set_default_status
    status ||= self.class.statuses[:audit]
  end
end