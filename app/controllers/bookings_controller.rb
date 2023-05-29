class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @instrument = Instrument.find(params[:instrument_id])
    @owner = User.find(params[:instrument_id])
  end

  def create
  end

  private

  # strong params need to go here
end
