class WeeklyMailerJob < ApplicationJob
  queue_as :default

  def perform
    start_date = 1.week.ago.beginning_of_week
    end_date = 1.week.ago.end_of_week

    links = Link.where(created_at: start_date..end_date)

    user = User.first

    WeeklyMailer.weekly_posts_email(user, links).deliver_later
  end
end
