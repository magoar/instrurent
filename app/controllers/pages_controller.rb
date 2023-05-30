class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @instruments = Instrument.all
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :instrument_type, :user_id, :description, :price_per_day, :photo)
  end
end
