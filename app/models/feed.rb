require 'feedjira'
require 'http'


class Feed < ApplicationRecord
  has_many :entries, dependent: :destroy

  def fetch_and_parse
    rss_feed = Feedjira.parse(HTTP.get(url).to_s)

    update(
      title: rss_feed.title,
    #   description: rss_feed.description
    )

    rss_feed.entries.each do |entry|
      entries.find_or_create_by(url: entry.url) do |e|
        e.title = entry.title
        e.published_at = entry.published
        e.summary = entry.summary
      end
    end
  end
end
