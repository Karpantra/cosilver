class RemoveColumnsFromProviders < ActiveRecord::Migration[5.0]
  def change
    remove_column :providers, :email
    remove_column :providers, :password
    remove_column :providers, :first_name
    remove_column :providers, :last_name
  end
end
