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
Hospital.destroy_all

hospital1 = Hospital.create!

department1 = Department.create!(hospital: hospital1)

user1 = User.create!(email: "admin@hotmail.fr", password: "azerty", password_confirmation: "azerty", first_name: "User1", last_name: "On-call", department: department1)

user2 = User.create!(email: "user2@hotmail.fr", password: "baby21", password_confirmation: "baby21", first_name: "User2", last_name: "On-duty",department: department1)

user3 = User.create!(email: "user3@hotmail.fr", password: "baby21", password_confirmation: "baby21", first_name: "User3", last_name: "Default", department: department1)





Booking.create!(on_call: true, date: "2023-11-29", user: user1)

Booking.create!(on_call: false, date: "2023-11-29", user: user2)

Booking.create!(on_call: nil, date: "2023-11-29", user: user3)
