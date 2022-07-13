class CreateBookingPassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :booking_passengers do |t|
      t.belongs_to :booking
      t.belongs_to :passenger
      t.timestamps
    end
  end
end
