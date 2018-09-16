class PumpController < BaseController
  def index
    @pumps = current_user.pumps
    @pump = Pump.new
  end

  def create
    current_user.account.pumps.create(pump_params)
    redirect_to pump_index_path
  end

  private

  def pump_params
    params.require(:pump).permit(:amount, :pump_time)
  end
end
