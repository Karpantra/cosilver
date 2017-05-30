class CreateFlatEquipments < ActiveRecord::Migration[5.0]
  def change
    create_table :flat_equipments do |t|
      t.integer :amount
      t.references :flat, foreign_key: true
      t.references :equipment, foreign_key: true

      t.timestamps
    end
  end
end
