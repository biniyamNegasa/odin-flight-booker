class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.integer :flight_id

      t.timestamps
    end
  end
end
