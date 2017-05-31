class AddColumnsToProviders < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :first_name, :string
    add_column :providers, :last_name, :string
  end
end
