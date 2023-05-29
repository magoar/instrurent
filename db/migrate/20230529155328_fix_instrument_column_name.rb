class FixInstrumentColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :instruments, :type, :instrument_type
    add_column :instruments, :description, :text
  end
end
