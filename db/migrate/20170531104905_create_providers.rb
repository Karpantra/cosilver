class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
