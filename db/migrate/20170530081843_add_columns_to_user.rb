class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :owner, :boolean
    add_column :users, :hobbies, :string
    add_column :users, :description, :text
    add_column :users, :gender, :string
  end
end
