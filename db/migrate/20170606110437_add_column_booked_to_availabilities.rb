class AddColumnBookedToAvailabilities < ActiveRecord::Migration[5.0]
  def change
    add_column :availabilities, :booked, :boolean, default: false
  end
end
