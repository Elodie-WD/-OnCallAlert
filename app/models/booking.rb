class Booking < ApplicationRecord
  belongs_to :user

  validates :on_call, presence: true
end
