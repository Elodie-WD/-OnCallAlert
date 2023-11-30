class Chatroom < ApplicationRecord
  belongs_to :department
  has_many :messages, dependent: :destroy
  validates :date, presence: true
  has_many :users, through: :messages
end
