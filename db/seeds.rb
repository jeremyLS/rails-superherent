# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying all database..."

Booking.destroy_all
Superhero.destroy_all
User.destroy_all

puts "creating users..."

jeremy = User.create!(name: "jeremyls", email: "jeremy@example.com", password: "azerty", photo: File.open(Rails.root.join("db/fixtures/users/jeremy.jpg")))
thomas = User.create!(name: "thomasd", email: "thomas@example.com", password: "azerty", photo: File.open(Rails.root.join("db/fixtures/users/thomas.jpg")))
renaud = User.create!(name: "renauds", email: "renaud@example.com", password: "azerty", photo: File.open(Rails.root.join("db/fixtures/users/renaud.jpg")))
camille = User.create!(name: "camillelb", email: "camille@example.com", password: "azerty", photo: File.open(Rails.root.join("db/fixtures/users/camille.jpg")))

puts "creating Superheroes..."

superman = Superhero.create!(owner: renaud, name: "Superman", address: "Nantes", power: "fly", description: "Cool superhero wouhouuuu", good: true, daily_price: 200, photo: File.open(Rails.root.join("db/fixtures/superheroes/superman.jpg")))
batman = Superhero.create!(owner: jeremy, name: "Batman", address: "Nantes", power: "cash", description: "Cool superhero wouhouuuu", good: true, daily_price: 200, photo: File.open(Rails.root.join("db/fixtures/superheroes/batman.jpg")))
joker = Superhero.create!(owner: camille, name: "Joker", address: "Nantes", power: "asshole", description: "Cool superhero wouhouuuu", good: false, daily_price: 200, photo: File.open(Rails.root.join("db/fixtures/superheroes/joker.jpg")))
ironman = Superhero.create!(owner: renaud, name: "Ironman", address: "Nantes", power: "powerfull armure", description: "Cool superhero wouhouuuu", good: true, daily_price: 200, photo: File.open(Rails.root.join("db/fixtures/superheroes/ironman.jpg")))
hulk = Superhero.create!(owner: thomas, name: "Hulk", address: "Nantes", power: "strengh", description: "Cool superhero wouhouuuu", good: true, daily_price: 200, photo: File.open(Rails.root.join("db/fixtures/superheroes/hulk.jpg")))
thor = Superhero.create!(owner: camille, name: "Thor", address: "Nantes", power: "big hamer", description: "Cool superhero wouhouuuu", good: true, daily_price: 200, photo: File.open(Rails.root.join("db/fixtures/superheroes/thor.jpg")))
catwoman = Superhero.create!(owner: jeremy, name: "Catwoman", address: "Nantes", power: "discret", description: "Cool superhero wouhouuuu", good: true, daily_price: 200, photo: File.open(Rails.root.join("db/fixtures/superheroes/catwoman.jpg")))
captain_america = Superhero.create!(owner: renaud, name: "Captain America", address: "Nantes", power: "patriot", description: "Cool superhero wouhouuuu", good: true, daily_price: 200, photo: File.open(Rails.root.join("db/fixtures/superheroes/captain_america.jpg")))
aquaman = Superhero.create!(owner: thomas, name: "Aquaman", address: "Nantes", power: "swim", description: "Cool superhero wouhouuuu", good: true, daily_price: 200, photo: File.open(Rails.root.join("db/fixtures/superheroes/aquaman.jpg")))
flash = Superhero.create!(owner: camille, name: "Flash", address: "Nantes", power: "run fast", description: "Cool superhero wouhouuuu", good: true, daily_price: 200, photo: File.open(Rails.root.join("db/fixtures/superheroes/flash.jpg")))
green_lantern = Superhero.create!(owner: thomas, name: "Green Lantern", address: "Nantes", power: "see in dark", description: "Cool superhero wouhouuuu", good: true, daily_price: 200, photo: File.open(Rails.root.join("db/fixtures/superheroes/green_lantern.jpg")))

puts "creating bookings..."

Booking.create!(total_price: 400, start_date: "2018-08-01", end_date: "2018-08-03", status: "accepted", renter: jeremy, superhero: superman)

Booking.create!(total_price: 400, start_date: "2018-08-20", end_date: "2018-08-25", status: "pending", renter: renaud, superhero: catwoman)
Booking.create!(total_price: 400, start_date: "2018-08-23", end_date: "2018-08-31", status: "pending", renter: camille, superhero: catwoman)
Booking.create!(total_price: 400, start_date: "2018-08-01", end_date: "2018-08-03", status: "declined", renter: thomas, superhero: batman)
















