class WeeklyMailer < ApplicationMailer
    default from: "no-reply@example.com"

    def weekly_posts_email(user, links)
      @user = user
      @links = links
      mail(to: @user.email, subject: "Your Weekly Posts Digest")
    end
end
