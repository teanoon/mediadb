class SourceWorker
  include Sidekiq::Worker

  def perform source_id
    Source.find_by_id(source_id).try(:create_articles)
  end
end