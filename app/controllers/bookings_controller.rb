class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @instrument = Instrument.find(params[:instrument_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @instrument = Instrument.find(params[:instrument_id])
    @booking.instrument = @instrument
    @booking.user = current_user
    @booking.save
    redirect_to root_path # redirect to dashboard once established
  end

  private

  def booking_params
    params.require(:booking).permit(:rent_date, :instrument_id)
  end
end
