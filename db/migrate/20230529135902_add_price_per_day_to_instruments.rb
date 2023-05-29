class AddPricePerDayToInstruments < ActiveRecord::Migration[7.0]
  def change
    add_column :instruments, :price_per_day, :integer
  end
end
