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

superman = Superhero.create!(owner: renaud, name: "Superman", address: "32 rue Desoulières, 44000 Nantes", power: "Fly", description: "He can fly fast, save cats from trees ! Available in Nantes but he can moves where ever you want. He's a good guy and wears a red cape. He's also a journalist, don't hesitate to use him to write articles for you!", good: true, daily_price: 200, photo: File.open(Rails.root.join("db/fixtures/superheroes/superman.jpg")))
batman = Superhero.create!(owner: jeremy, name: "Batman", address: "26 boulevard Stalingrad, 44000 Nantes", power: "Cash", description: "He is a strange man. Thinks like a bat, acts weird but he has a lot of money and a butler : Alfred. He can pay your bills, invite you to diner, drive you where you want in his Batmobile.", good: true, daily_price: 500, photo: File.open(Rails.root.join("db/fixtures/superheroes/batman.jpg")))
joker = Superhero.create!(owner: camille, name: "Joker", address: "32 rue de la Patrie, 56100 Lorient", power: "Asshole", description: "He is the worst. He will destroy your house, your life and everything you care about. He's a drinker. Never play a game with him, never bet something with him even if you win, you will loose. He is availible for family diner, batchelor parties, destroying your ex life... Many possibilities !", good: false, daily_price: 50, photo: File.open(Rails.root.join("db/fixtures/superheroes/joker.jpg")))
ironman = Superhero.create!(owner: renaud, name: "Ironman", address: "5 rue Mederic, 75017 Paris", power: "Powerfull Armure", description: "Wow ! That's a great armure ! The best you'll ever see ! He can fly, do the robot dance and take you to diner. He is rich and kind of bored so he will do anything to pass the time. He is not the funiest but his armure is shiny!", good: true, daily_price: 600, photo: File.open(Rails.root.join("db/fixtures/superheroes/ironman.jpg")))
hulk = Superhero.create!(owner: thomas, name: "Hulk", address: "58 boulevard Vauban, 13006 Marseille", power: "Strengh", description: "He like the Geant Vert but on steroids ! (and he will not force you to eat your vegetable). He can help you to move furnitures. He's an hardcore ecologist be carefull your carbon print is not to high otherwise he turns against you.", good: true, daily_price: 300, photo: File.open(Rails.root.join("db/fixtures/superheroes/hulk.jpg")))
thor = Superhero.create!(owner: camille, name: "Thor", address: "79 cours Sextius, 13100 Aix-en-Provence", power: "Big Hamer", description: "Thor is the best for build-up furnitures. He has a hamer (magic one) and he is swedish ! Ideal for all your Ikea furnitures. If you have to destroy a wall or anything he's the deal! Of course he's polite and will clean after his mess.", good: true, daily_price: 200, photo: File.open(Rails.root.join("db/fixtures/superheroes/thor.jpg")))
catwoman = Superhero.create!(owner: jeremy, name: "Catwoman", address: "16 villa Gaudelet, 75011 Paris", power: "Discret", description: "She is so discret you'll never know she's here. She will sleep on your laptop, will ask for food when your asleep and do her finger nails on the walls. But ! She can steal anything you want (jewels, art, clothes, money...). She is not a talker but she pur when happy. (She can catch mices and birds for your diner too)", good: true, daily_price: 700, photo: File.open(Rails.root.join("db/fixtures/superheroes/catwoman.jpg")))
captain_america = Superhero.create!(owner: renaud, name: "Captain America", address: "23 rue Paul Montrochet, 69002 Lyon", power: "Patriot", description: "SOOOOOO patriot ! He knows the national hymn of all the countries (lyrics and music). He will support the team you want. He is not smart so don't try to have a long conversation, you will desapointed.", good: true, daily_price: 30, photo: File.open(Rails.root.join("db/fixtures/superheroes/captain_america.jpg")))
aquaman = Superhero.create!(owner: thomas, name: "Aquaman", address: "2 avenue des Saules, 59160 Lille", power: "Swim", description: "He can teach you how to swim like a dolphin. If you want to discover the sea he will introduce you to every fish in the oceans. On summer holidays you can rent him on your own pool, he is quite adaptable!", good: true, daily_price: 150, photo: File.open(Rails.root.join("db/fixtures/superheroes/aquaman.jpg")))
flash = Superhero.create!(owner: camille, name: "Flash", address: "Cantersteen 10, 1000 Bruxelles, Belgium", power: "Run Fast", description: "You have a package to deliver ? He is the solution. He will do it faster than sending an email. If you need to go somewhere he will drive you on his back faster than the concorde. He is so fast that you have to jump on him, he never stop running. ", good: true, daily_price: 400, photo: File.open(Rails.root.join("db/fixtures/superheroes/flash.jpg")))
green_lantern = Superhero.create!(owner: thomas, name: "Green Lantern", address: "107 Cours Balguerie Stuttenberg, 33300 Bordeaux", power: "See in the Dark", description: "You're affraid of the dark? He has the solution. He is a permanent light. You'll always see where you go with him. The light of his lantern is green so no mosquitos will bother you", good: true, daily_price: 100, photo: File.open(Rails.root.join("db/fixtures/superheroes/green_lantern.jpg")))

puts "creating bookings..."

Booking.create!(total_price: 400, start_date: "2018-08-01", end_date: "2018-08-03", status: "accepted", renter: jeremy, superhero: superman)

Booking.create!(total_price: 1400, start_date: "2018-08-20", end_date: "2018-08-25", status: "pending", renter: renaud, superhero: catwoman)
Booking.create!(total_price: 700, start_date: "2018-08-23", end_date: "2018-08-31", status: "pending", renter: camille, superhero: catwoman)
Booking.create!(total_price: 1000, start_date: "2018-08-01", end_date: "2018-08-03", status: "declined", renter: thomas, superhero: batman)
















