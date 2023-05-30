class InstrumentsController < ApplicationController

  def show
    @instrument = Instrument.find(params[:id])
    @user = User.find(@instrument.user_id)
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    @instrument.save
    redirect_to instrument_path(@instrument)
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :instrument_type, :user_id, :description, :price_per_day, :photo)
  end
end
