# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "creating 20 Fake instruments"
list_of_instruments = %w(piano violin cello viola flute guitar clarinette oboe trombone drum organ)
20.times do
  Instrument.create(
    name: list_of_instruments.sample,
    user: User.first,
    price_per_day: 1200,
    description: "Wahst a nice instrument!"
  )
end
