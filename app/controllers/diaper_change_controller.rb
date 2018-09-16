class DiaperChangeController < BaseController
  def index
    @diaper_changes = current_user.diaper_changes
    @diaper_change = DiaperChange.new
  end

  def create
    diaper_change = current_user.account.diaper_changes.build(diaper_change_params)
    diaper_change.diaper_type = params[:diaper_change][:diaper_type]&.join(', ') || "Nothing?"
    diaper_change.save
    redirect_to diaper_change_index_path
  end

  private

  def diaper_change_params
    params.require(:diaper_change).permit(:change_time)
  end
end
