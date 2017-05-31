class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :category
      t.string :title
      t.string :price_per_hour
      t.string :description
      t.string :address
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
