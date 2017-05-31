class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :delivered_at
      t.datetime :booked_at
      t.references :service, foreign_key: true
      t.references :flat, foreign_key: true

      t.timestamps
    end
  end
end
