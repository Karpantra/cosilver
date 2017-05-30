class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.text :content
      t.string :title
      t.integer :price
      t.integer :room_size
      t.references :flat, foreign_key: true

      t.timestamps
    end
  end
end
