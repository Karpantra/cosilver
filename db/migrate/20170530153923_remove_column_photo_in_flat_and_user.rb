class RemoveColumnPhotoInFlatAndUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :photo, :string
    remove_column :flats, :photo, :string
  end
end
