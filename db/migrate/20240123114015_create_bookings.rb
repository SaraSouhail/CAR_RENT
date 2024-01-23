class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :car, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.date :start_day
      t.date :end_day
      t.string :status

      t.timestamps
    end
  end
end
