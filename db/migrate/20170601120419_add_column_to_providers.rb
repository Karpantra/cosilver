class AddColumnToProviders < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :seed_picture, :string
  end
end
