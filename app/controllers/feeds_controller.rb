class FeedsController < ApplicationController
    before_action :prevent_unauthorized_user_access, only: [:new]

    def index
      # Entry.where("published_at > ?",   7.days.ago)
      @feeds = Feed.all   
      if params[:time_filter] == "last_week"
        @time_filter = 7.days.ago
      elsif params[:time_filter] == "last_month"
        @time_filter = 31.days.ago 
      else
        @time_filter = 365.days.ago
      end
      @last_published_at = Entry.maximum(:published_at)
    end
  
    def show
      @feed = Feed.find(params[:id])
      @entries = @feed.entries.order(published_at: :desc)
    end
  
    def new
      @feed = Feed.new
    end
  
    def create
      @feed = Feed.new(feed_params)
      if @feed.save
        @feed.fetch_and_parse
        redirect_to feeds_path, notice: 'Feed added successfully!'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def feed_params
      params.require(:feed).permit(:url)
    end
  end
  