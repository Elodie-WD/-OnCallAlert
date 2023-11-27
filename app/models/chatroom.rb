class Chatroom < ApplicationRecord
  belongs_to :department
  has_many :messages
  validates :date, presence: true
end
