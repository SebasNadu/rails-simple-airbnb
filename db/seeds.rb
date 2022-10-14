# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Flat.destroy_all
puts "all flats destroyed"
5.times do
 new = Flat.create(
    name: Faker::TvShows::Friends.location,
    address: Faker::Address.street_address,
    description: Faker::TvShows::Friends.quote, 
    price_per_night: rand(25..1000),
    number_of_guests: rand(1..10)
  )
 puts new.id 
end
puts "flats created"
