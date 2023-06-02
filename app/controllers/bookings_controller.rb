class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @instrument = Instrument.find(params[:instrument_id])
    @booking.instrument = @instrument
    @booking.user = current_user
    @booking.save
    flash[:notice] = 'You successfully booked the instrument!'
    redirect_to dashboard_path
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(status: "accepted")
    flash[:notice] = "You accepted the request of #{@booking.user}!"
    redirect_to instrument_path(flag: "dasboard")
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:notice] = 'You successfully deleted your booking!'
    redirect_to dashboard_path(flag: "dasboard"), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:rent_date)
  end
end
