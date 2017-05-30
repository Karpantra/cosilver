class RemoveCoordinatesToFlats < ActiveRecord::Migration[5.0]
  def change
    remove_column :flats, :latitude, :float
    remove_column :flats, :longitude, :string
    remove_column :flats, :float, :string
  end
end
