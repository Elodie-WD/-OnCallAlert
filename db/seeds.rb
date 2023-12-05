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
# Message.destroy_all

hospital1 = Hospital.create!(name: "pellegrin", address: "rue de la pelouse de douet 33000 Bordeaux")

department1 = Department.create!(hospital: hospital1)


# Week 1----------------------------------------------------------------------
user1 = User.create!(email: "admin@hotmail.fr", password: "azerty", password_confirmation: "azerty", first_name: "Anthony", last_name: "Dr. ROUSSEL", department: department1, address: "107 Cr Balguerie Stuttenberg, 33300 Bordeaux")
user2 = User.create!(email: "user2@hotmail.fr", password: "baby21", password_confirmation: "baby21", first_name: "Emilie", last_name: "Dr. DALLET-PAULY",department: department1)
user3 = User.create!(email: "user3@hotmail.fr", password: "baby21", password_confirmation: "baby21", first_name: "Nadia", last_name: "Default", department: department1)


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
user4 = User.create!(email: "user4@hotmail.fr", password: "baby21", password_confirmation: "baby21", first_name: "Alexis", last_name: "Dr. LOUBES", department: department1)
user5 = User.create!(email: "user5@hotmail.fr", password: "baby21", password_confirmation: "baby21", first_name: "Fany", last_name: "Dr. GUERIN",department: department1)
user6 = User.create!(email: "user6@hotmail.fr", password: "baby21", password_confirmation: "baby21", first_name: "Clement", last_name: "Dr. DAGUES", department: department1)

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
user7 = User.create!(email: "user7@hotmail.fr", password: "baby21", password_confirmation: "baby21", first_name: "Laura", last_name: "Dr. SOLER",department: department1)
user8 = User.create!(email: "user8@hotmail.fr", password: "baby21", password_confirmation: "baby21", first_name: "Sofian", last_name: "Dr. BENZEKRI", department: department1)
user9 = User.create!(email: "user9@hotmail.fr", password: "baby21", password_confirmation: "baby21", first_name: "Asma", last_name: "Dr. TOUALBI",department: department1)

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



chatroom1 = Chatroom.create!(name: "Chatroom1", date: "2023-11-30", department: department1)

chatroom2 = Chatroom.create!(name: "Chatroom2", date: "2023-11-29", department: department1)

chatroom3 = Chatroom.create!(name: "Chatroom3", date: "2023-11-28", department: department1)


Message.create!(content: "Hello", chatroom: chatroom1, user: user1)
Message.create!(content: "Salut Alice", chatroom: chatroom1, user: user2)
Message.create!(content: "Super merci, je suis d'astreinte aujourd'hui, comment est le service ce soir ?", chatroom: chatroom1, user: user1)
Message.create!(content: "Plutôt calme pour l'instant, je te tiens au jus", chatroom: chatroom1, user: user2)
