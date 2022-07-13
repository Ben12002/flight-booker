class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.belongs_to :flight
      t.integer :passenger_amount
      t.timestamps 
    end
  end
end
