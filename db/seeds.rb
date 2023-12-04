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
# Chatroom.destroy_all
Department.destroy_all
Hospital.destroy_all
# Message.destroy_all

hospital1 = Hospital.create!(name: "pellegrin", address: "rue de la pelouse de douet 33000 Bordeaux")

department1 = Department.create!(hospital: hospital1)

user1 = User.create!(email: "admin@hotmail.fr", password: "azerty", password_confirmation: "azerty", first_name: "Alice", last_name: "On-call", department: department1)
user2 = User.create!(email: "user2@hotmail.fr", password: "baby21", password_confirmation: "baby21", first_name: "Baptiste", last_name: "On-duty",department: department1)
user3 = User.create!(email: "user3@hotmail.fr", password: "baby21", password_confirmation: "baby21", first_name: "Nadia", last_name: "Default", department: department1)


Booking.create!(on_call: true, date: "2023-12-04", user: user1, status: false)

Booking.create!(on_call: false, date: "2023-12-04", user: user2, status: false)

Booking.create!(on_call: nil, date: "2023-12-04", user: user3, status: false)


Booking.create!(on_call: true, date: "2023-12-05", user: user2, status: false)

Booking.create!(on_call: false, date: "2023-12-05", user: user1, status: false)

Booking.create!(on_call: nil, date: "2023-12-05", user: user3, status: false)


Booking.create!(on_call: false, date: "2023-12-06", user: user1, status: false)

Booking.create!(on_call: true, date: "2023-12-06", user: user2, status: false)

Booking.create!(on_call: nil, date: "2023-12-06", user: user3, status: false)


Booking.create!(on_call: true, date: "2023-12-07", user: user1, status: false)

Booking.create!(on_call: false, date: "2023-12-07", user: user2, status: false)

Booking.create!(on_call: nil, date: "2023-12-07", user: user3, status: false)


Booking.create!(on_call: false, date: "2023-12-08", user: user2, status: false)

Booking.create!(on_call: true, date: "2023-12-08", user: user1, status: false)

Booking.create!(on_call: nil, date: "2023-12-08", user: user3, status: false)


chatroom1 = Chatroom.create!(name: "Chatroom1", date: "2023-11-30", department: department1)

chatroom2 = Chatroom.create!(name: "Chatroom2", date: "2023-11-29", department: department1)

chatroom3 = Chatroom.create!(name: "Chatroom3", date: "2023-11-28", department: department1)


Message.create!(content: "hello", chatroom: chatroom1, user: user1)
Message.create!(content: "Salut Alice", chatroom: chatroom1, user: user2)
Message.create!(content: "Super merci, je suis d'astreinte aujourd'hui, comment est le service ce soir ?", chatroom: chatroom1, user: user1)
Message.create!(content: "Plutôt calme pour l'instant, je te tiens au jus", chatroom: chatroom1, user: user2)
