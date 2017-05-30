class CreateFlats < ActiveRecord::Migration[5.0]
  def change
    create_table :flats do |t|
      t.string :category
      t.string :address
      t.string :city
      t.integer :service_charges
      t.integer :deposit
      t.text :description
      t.integer :flat_area
      t.integer :max_roommmates
      t.integer :number_pieces
      t.boolean :smoker
      t.boolean :animals
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
