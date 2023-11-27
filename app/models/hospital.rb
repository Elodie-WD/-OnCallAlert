class Hospital < ApplicationRecord
  has_many :departments

  validates :name, presence: true
  validates :address, presence: true
end
