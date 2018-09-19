class DiaperChangeController < BaseController
  def index
    @diaper_changes = current_user.diaper_changes
    @diaper_change = DiaperChange.new
  end

  def create
    current_user.account.diaper_changes.build.tap do |diaper_change|
      diaper_change.diaper_type = params[:diaper_change] && params[:diaper_change][:diaper_type]&.join(', ') || "Nothing?"
      diaper_change.change_time = retrieve_diaper_change_time
      diaper_change.save
    end
    redirect_to diaper_change_index_path
  end

  private

  def retrieve_diaper_change_time
    params[:time] + ' ' + params[:cycle]
  end
end
