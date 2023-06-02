class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @instruments = Instrument.page(page).per(8)
    if params[:query].present?
      @instruments = @instruments.global_search(params[:query])
    end

    if page > 1
      render turbo_stream: turbo_stream.append(
        instruments_list_target,
        partial: "pages/instrument-cards",
        locals: { instruments: @instruments}
      )
    end
  end

  def dashboard
  end

  private

  def page
    params.fetch(:page, 1).to_i
  end

  def instruments_list_target
    params.fetch(:turbo_target, "instruments-list")
  end

  def instrument_params
    params.require(:instrument).permit(:name, :instrument_type, :user_id, :description, :price_per_day, :photo)
  end
end
