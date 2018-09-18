class PumpController < BaseController
  def index
    @pumps = current_user.pumps
    @pump = Pump.new
  end

  def create
    current_user.account.pumps.build(pump_params).tap do |pump|
      pump.pump_time = retrieve_pump_time
      pump.save
    end
    redirect_to pump_index_path
  end

  private

  def pump_params
    params.require(:pump).permit(:amount)
  end

  def retrieve_pump_time
    params[:pump_time] + ' ' + params[:cycle]
  end
end
