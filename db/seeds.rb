require 'date'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

puts "creating Bach and Vivaldi users"
User.create(
  email: "sebastian.bach@web.de",
  password: "sebastian.bach@web.de"
)
User.create(
  email: "antonio.vivaldi@web.de",
  password: "antonio.vivaldi@web.de"
)

puts "creating Bach's Kirchenorgel"
Instrument.create(
  name: "Kirchenorgel",
  user: User.find(1),
  instrument_type: "organ",
  price_per_day: 50,
  description: "Perfect for playing the Toccata and Fugue in D minor, BWV 565!"
)

puts "creating Vivaldi's Miglior Violino"
Instrument.create(
  name: "Miglior Violino",
  user: User.find(2),
  instrument_type: "viola",
  price_per_day: 50,
  description: "Perfect for playing the four seasons!"
)

puts "creating 20 Fake instruments"
list_of_instruments = %w(Violin Cello Trumpet Viola Oboe Drums Guitar Clarinet Flute Gibson)
list_of_images = ["https://res.cloudinary.com/dera4cgch/image/upload/v1685459956/instruments/Violin-Giuseppe_Guarneri_Cremona1717_blzt1y.png",
                  "https://res.cloudinary.com/dera4cgch/image/upload/v1685459955/instruments/Cello-GiovanniFrancescoPressenda_Turin1835_zampuc.png",
                  "https://res.cloudinary.com/dera4cgch/image/upload/v1685459954/instruments/Trumpet-HytechGold-TrumpetinBb_sa0n67.png",
                  "https://res.cloudinary.com/dera4cgch/image/upload/v1685459954/instruments/Viola-Giuseppe_Guadagnini__Como_1780_finya0.png",
                  "https://res.cloudinary.com/dera4cgch/image/upload/v1685459954/instruments/Oboe-Yamaha-YOB-431M_krljfb.png",
                  "https://res.cloudinary.com/dera4cgch/image/upload/v1685459954/instruments/Drumset-PearlEXX705NBR_kimnjw.png",
                  "https://res.cloudinary.com/dera4cgch/image/upload/v1685459953/instruments/E_Guitar-Fender_rcb77y.png",
                  "https://res.cloudinary.com/dera4cgch/image/upload/v1685459953/instruments/Clarinet-YamahaYCL-457II-20_vdw37n.png",
                  "https://res.cloudinary.com/dera4cgch/image/upload/v1685459953/instruments/Flute-PearlFlute_PF505_zatdhl.png",
                  "https://res.cloudinary.com/dera4cgch/image/upload/v1685459953/instruments/E-Guitar_GibsonLesPaulClassic_bc2oeq.png"
                ]
10.times do
  index = rand(0..9)
  instrument = Instrument.create(
    name: list_of_instruments[index],
    user: User.first,
    instrument_type: list_of_instruments[index],
    price_per_day: rand(10..50),
    description: "In perfect conditions, ready to use!"
  )
  file = URI.open(list_of_images[index])
  instrument.photo.attach(io: file, filename: "instrument.png", content_type: "image/png")
  instrument.save
end

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
