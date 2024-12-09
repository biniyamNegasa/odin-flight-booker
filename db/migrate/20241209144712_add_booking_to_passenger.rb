class AddBookingToPassenger < ActiveRecord::Migration[7.2]
  def change
    add_reference :passengers, :booking, null: false
  end
end
