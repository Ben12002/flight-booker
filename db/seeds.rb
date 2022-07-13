# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Airport.delete_all
Flight.delete_all
# Booking.delete_all
# Passenger.delete_all

a1 = Airport.create(code: "YVR")
a2 = Airport.create(code: "BER")
a3 = Airport.create(code: "HND")
a4 = Airport.create(code: "NRT")
a5 = Airport.create(code: "SIN")
a6 = Airport.create(code: "CGK")

Flight.create(departure_airport_id: a1.id, arrival_airport_id: a2.id, departure_time: DateTime.new(2001,2,3,4,5,6), duration: 7)
Flight.create(departure_airport_id: a1.id, arrival_airport_id: a2.id, departure_time: DateTime.new(2001,2,3,4,5,6), duration: 17)
Flight.create(departure_airport_id: a2.id, arrival_airport_id: a3.id, departure_time: DateTime.new(2002,2,3,4,5,6), duration: 8)
Flight.create(departure_airport_id: a3.id, arrival_airport_id: a4.id, departure_time: DateTime.new(2003,2,3,4,5,6), duration: 9)
Flight.create(departure_airport_id: a4.id, arrival_airport_id: a5.id, departure_time: DateTime.new(2004,2,3,4,5,6), duration: 10)
Flight.create(departure_airport_id: a3.id, arrival_airport_id: a1.id, departure_time: DateTime.new(2005,3,4,5,5,6), duration: 11)
