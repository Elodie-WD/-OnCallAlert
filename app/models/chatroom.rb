class Chatroom < ApplicationRecord
  belongs_to :department
  has_many :messages, dependent: :destroy
  validates :date, presence: true
  has_many :users, through: :messages

# chatroom.users.uniq
def chatroom_contact(date, user)
  Booking.all.where(date: date).where.not(user: user).first.user.first_name
end



end
