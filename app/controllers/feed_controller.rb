class FeedController < BaseController
  def index
    @feeds = current_user.feeds
    @feed = Feed.new
  end

  def create
    current_user.account.feeds.create(feed_params)
    redirect_to feed_index_path
  end

  private

  def feed_params
    params.require(:feed).permit(:amount, :feed_time)
  end
end
