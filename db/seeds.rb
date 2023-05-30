require 'date'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "creating Bach and Vivaldi users"
User.create(
  email: "sebastian.bach@web.de",
  password: "sebastian.bach@web.de"
)
User.create(
  email: "antonio.vivaldi@web.de",
  password: "password"
)

p "created user valid? = #{User.last.valid?}"

puts "creating Bach's Kirchenorgel"
Instrument.create(
  name: "Kirchenorgel",
  user: User.find(1),
  instrument_type: "organ",
  price_per_day: 50,
  description: "Perfect for playing the Toccata and Fugue in D minor, BWV 565!"
)
p "created instrument valid? = #{Instrument.last.valid?}"

puts "creating Vivaldi's Miglior Violino"
Instrument.create(
  name: "Miglior Violino",
  user: User.find(2),
  instrument_type: "viola",
  price_per_day: 50,
  description: "Perfect for playing the four seasons!"
)
p "created instrument valid? = #{Instrument.last.valid?}"

puts "creating 20 Fake instruments"
list_of_instruments = %w(piano violin cello viola flute guitar clarinette oboe trombone drum organ)
20.times do
  Instrument.create(
    name: list_of_instruments.sample,
    user: User.first,
    instrument_type: list_of_instruments.sample,
    price_per_day: 50,
    description: "What a nice instrument!"
  )
end

p "created instrument valid? = #{Instrument.last.valid?}"

puts "creating a fake pending booking for Vivaldi"
Booking.create(
  rent_date: Date.today,
  user_id: User.find(2),
  instrument_id: Instrument.find(1)
)

puts "creating a fake accepted booking for Vivaldi"
Booking.create(
  rent_date: Date.yesterday,
  user_id: User.find(2),
  instrument_id: Instrument.find(1),
  status: "accepted"
)

puts "creating a fake rejected booking for Vivaldi"
Booking.create(
  rent_date: Date.yesterday,
  user_id: User.find(2),
  instrument_id: Instrument.find(1),
  status: "rejected"
)

puts "creating a fake pending booking for Bach"
Booking.create(
  rent_date: Date.today,
  user_id: User.find(1),
  instrument_id: Instrument.find(2)
)

puts "creating a fake accepted booking for Bach"
Booking.create(
  rent_date: Date.yesterday,
  user_id: User.find(1),
  instrument_id: Instrument.find(2),
  status: "accepted"
)

puts "creating a fake rejected booking for Bach"
Booking.create(
  rent_date: Date.yesterday,
  user_id: User.find(1),
  instrument_id: Instrument.find(2),
  status: "rejected"
)
