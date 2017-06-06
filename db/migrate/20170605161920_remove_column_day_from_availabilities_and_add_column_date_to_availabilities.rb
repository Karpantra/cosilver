class RemoveColumnDayFromAvailabilitiesAndAddColumnDateToAvailabilities < ActiveRecord::Migration[5.0]
  def change
    remove_column :availabilities, :day, :string
    add_column :availabilities, :date, :date
  end
end
