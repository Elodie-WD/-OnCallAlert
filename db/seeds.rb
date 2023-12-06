# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# User.destroy_all
# Booking.destroy_all
# Department.destroy_all
Chatroom.destroy_all
Department.destroy_all
Hospital.destroy_all
Message.destroy_all

hospital1 = Hospital.create!(name: "pellegrin", address: "rue de la pelouse de douet, 33000 Bordeaux")

department1 = Department.create!(hospital: hospital1)


# Week 1----------------------------------------------------------------------
user1 = User.create!(email: "alice@chu.fr", password: "baby21", password_confirmation: "baby21", first_name: "Dr. Alice", last_name: "ROUSSEL", phone_number: "06.22.98.97.34", department: department1, address: "107 cours Balguerie Stuttenberg, 33300 Bordeaux")
user2 = User.create!(email: "benoit@chu.fr", password: "baby21", password_confirmation: "baby21", first_name: "Dr. Benoit", last_name: "DALLET", phone_number: "06.12.00.12.43", department: department1, address: "12 avenue de verdun, 33700 Merignac")
user3 = User.create!(email: "clara@chu.fr", password: "baby21", password_confirmation: "baby21", first_name: "Dr. Clara", last_name: "NIEL", phone_number: "06.45.42.38.21", department: department1, address: "8 rue henri wallon, 3310 Begles")

Booking.create!(on_call: true, date: "2023-12-05", user: user1, status: false)

Booking.create!(on_call: false, date: "2023-12-05", user: user2, status: false)

Booking.create!(on_call: nil, date: "2023-12-05", user: user3, status: false)


Booking.create!(on_call: false, date: "2023-12-06", user: user1, status: false)

Booking.create!(on_call: true, date: "2023-12-06", user: user2, status: false)

Booking.create!(on_call: nil, date: "2023-12-06", user: user3, status: false)


Booking.create!(on_call: true, date: "2023-12-07", user: user1, status: false)

Booking.create!(on_call: false, date: "2023-12-07", user: user2, status: false)

Booking.create!(on_call: nil, date: "2023-12-07", user: user3, status: false)


Booking.create!(on_call: false, date: "2023-12-08", user: user1, status: false)

Booking.create!(on_call: true, date: "2023-12-08", user: user2, status: false)

Booking.create!(on_call: nil, date: "2023-12-08", user: user3, status: false)

# Week 2--------------------------------------------------------------------
user4 = User.create!(email: "dany@chu.fr", password: "baby21", password_confirmation: "baby21", first_name: "Dr. Dany", last_name: "LOUBES", phone_number: "06.61.14.17.02", department: department1, address: "6 rue millet, 33600 Pessac")
user5 = User.create!(email: "emilie@chu.fr", password: "baby21", password_confirmation: "baby21", first_name: "Dr. Emilie", last_name: "GUERIN", phone_number: "06.73.54.32.18", department: department1, address: "1 rue charles gounod, 33400 Talence")
user6 = User.create!(email: "fanny@chu.fr", password: "baby21", password_confirmation: "baby21", first_name: "Dr. Fanny", last_name: "DAGUES", phone_number: "06.14.99.34.67", department: department1, address: "165 rue du clauet, 33140 Cadaujac")

Booking.create!(on_call: false, date: "2023-12-11", user: user4, status: false)

Booking.create!(on_call: true, date: "2023-12-11", user: user5, status: false)

Booking.create!(on_call: nil, date: "2023-12-11", user: user3, status: false)


Booking.create!(on_call: false, date: "2023-12-12", user: user5, status: false)

Booking.create!(on_call: true, date: "2023-12-12", user: user6, status: false)

Booking.create!(on_call: nil, date: "2023-12-12", user: user3, status: false)



Booking.create!(on_call: false, date: "2023-12-13", user: user6, status: false)

Booking.create!(on_call: true, date: "2023-12-13", user: user4, status: false)

Booking.create!(on_call: nil, date: "2023-12-13", user: user3, status: false)



Booking.create!(on_call: false, date: "2023-12-14", user: user5, status: false)

Booking.create!(on_call: true, date: "2023-12-14", user: user4, status: false)

Booking.create!(on_call: nil, date: "2023-12-14", user: user3, status: false)



Booking.create!(on_call: false, date: "2023-12-15", user: user6, status: false)

Booking.create!(on_call: true, date: "2023-12-15", user: user4, status: false)

Booking.create!(on_call: nil, date: "2023-12-15", user: user3, status: false)


Booking.create!(on_call: false, date: "2023-12-16", user: user5, status: false)

Booking.create!(on_call: true, date: "2023-12-16", user: user6, status: false)

Booking.create!(on_call: nil, date: "2023-12-16", user: user3, status: false)

# Week 3------------------------------------------------------------------
user7 = User.create!(email: "gabin@chu.fr", password: "baby21", password_confirmation: "baby21", first_name: "Dr. Gabin", last_name: "SOLER", phone_number: "06.08.89.92.17", department: department1, address: "4 route de jourdan, 33500 Libourne")
user8 = User.create!(email: "hugo@chu.fr", password: "baby21", password_confirmation: "baby21", first_name: "Dr. Hugo", last_name: "DONI", phone_number: "06.61.54.98.12", department: department1, address: "43 avenue de rome, 33530 Bassens")
user9 = User.create!(email: "iris@chu.fr", password: "baby21", password_confirmation: "baby21", first_name: "Dr. Iris", last_name: "TOUALBI", phone_number: "06.98.35.19.47", department: department1, address: "33 avenue de l'europe, 33290 Blaquefort")

Booking.create!(on_call: false, date: "2023-12-18", user: user7, status: false)

Booking.create!(on_call: true, date: "2023-12-18", user: user8, status: false)

Booking.create!(on_call: nil, date: "2023-12-18", user: user3, status: false)


Booking.create!(on_call: false, date: "2023-12-19", user: user8, status: false)

Booking.create!(on_call: true, date: "2023-12-19", user: user9, status: false)

Booking.create!(on_call: nil, date: "2023-12-19", user: user3, status: false)



Booking.create!(on_call: false, date: "2023-12-20", user: user8, status: false)

Booking.create!(on_call: true, date: "2023-12-20", user: user7, status: false)

Booking.create!(on_call: nil, date: "2023-12-20", user: user3, status: false)



Booking.create!(on_call: false, date: "2023-12-21", user: user7, status: false)

Booking.create!(on_call: true, date: "2023-12-21", user: user9, status: false)

Booking.create!(on_call: nil, date: "2023-12-21", user: user3, status: false)



Booking.create!(on_call: false, date: "2023-12-22", user: user7, status: false)

Booking.create!(on_call: true, date: "2023-12-22", user: user8, status: false)

Booking.create!(on_call: nil, date: "2023-12-22", user: user3, status: false)


Booking.create!(on_call: false, date: "2023-12-23", user: user9, status: false)

Booking.create!(on_call: true, date: "2023-12-23", user: user8, status: false)

Booking.create!(on_call: nil, date: "2023-12-23", user: user3, status: false)



chatroom1 = Chatroom.create!(name: "Chatroom1", date: "30/11/2023", department: department1)

chatroom2 = Chatroom.create!(name: "Chatroom2", date: "29/11/2023", department: department1)

chatroom3 = Chatroom.create!(name: "Chatroom3", date: "28/11/2023", department: department1)


Message.create!(content: "Hello", chatroom: chatroom1, user: user1)
Message.create!(content: "Salut Anthony", chatroom: chatroom1, user: user2)
Message.create!(content: "Super merci, je suis d'astreinte aujourd'hui, comment est le service ce soir ?", chatroom: chatroom1, user: user1)
Message.create!(content: "Plutôt calme pour l'instant, je te tiens au jus", chatroom: chatroom1, user: user2)
