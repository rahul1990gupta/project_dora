class FeedsController < ApplicationController
    before_action :prevent_unauthorized_user_access, only: [:new]

    def index
      @feeds = Feed.all
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
        redirect_to @feed, notice: 'Feed added successfully!'
      else
        render :new
      end
    end
  
    private
  
    def feed_params
      params.require(:feed).permit(:url)
    end
  end
  