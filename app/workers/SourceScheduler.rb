class SourceScheduler
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  # recurrence { hourly }
  
  def perform
    Source.all.each{ |source| SourceWorker.perform_async source.id }
  end
end