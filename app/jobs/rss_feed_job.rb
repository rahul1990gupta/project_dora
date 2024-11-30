class RssFeedJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Feed.all.each do |feed|
      feed.fetch_and_parse
    end
  end
end
