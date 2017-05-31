class RenameAvailabiltiesToAvailabilities < ActiveRecord::Migration[5.0]
  def change
    rename_table :availabilties, :availabilities
  end
end
