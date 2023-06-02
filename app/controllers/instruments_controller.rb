class InstrumentsController < ApplicationController
  def show
    @instrument = Instrument.find(params[:id])
    @user = User.find(@instrument.user_id)
    @booking = Booking.new
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    @instrument.save
    flash[:notice] = 'You successfully created the instrument!'
    redirect_to instrument_path(@instrument)
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
    flash[:notice] = 'You Deleted the instrument.'
    redirect_to dashboard_path(flag: "dashboard"), status: :see_other
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :instrument_type, :user_id, :description, :price_per_day, :photo)
  end
end
