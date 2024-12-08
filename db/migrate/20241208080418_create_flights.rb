class CreateFlights < ActiveRecord::Migration[7.2]
  def change
    create_table :flights do |t|
      t.datetime :start_datetime
      t.integer :duration

      t.timestamps
    end

    add_reference :flights, :departure_airport, null: false, foreign_key: { to_table: :airports }
    add_reference :flights, :arrival_airport, null: false, foreign_key: { to_table: :airports }
  end
end
