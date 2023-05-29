class InstrumentsController < ApplicationController

  def show
    @instrument = Instrument.find(params[:id])
  end

  def new
  end

  def create
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :type, :user_id)
  end
end
