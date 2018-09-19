class FeedController < BaseController
  def index
    @feeds = current_user.feeds
    @feed = Feed.new
  end

  def create
    current_user.account.feeds.build(feed_params).tap do |feed|
      feed.feed_time = retrieve_feed_time
      feed.save
    end
    redirect_to feed_index_path
  end

  private

  def feed_params
    params.require(:feed).permit(:amount)
  end

  def retrieve_feed_time
    params[:time] + ' ' + params[:cycle]
  end
end
