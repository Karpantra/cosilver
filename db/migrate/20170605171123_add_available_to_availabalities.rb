class AddAvailableToAvailabalities < ActiveRecord::Migration[5.0]
  def change
    add_column :availabilities, :available, :boolean, default: true
  end
end
