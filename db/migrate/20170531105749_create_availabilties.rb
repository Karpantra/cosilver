class CreateAvailabilties < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilties do |t|
      t.string :day
      t.datetime :start_time
      t.datetime :end_time
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
