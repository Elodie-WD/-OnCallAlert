class Hospital < ApplicationRecord
  has_many :departments, dependent: :destroy

  # validates :name, presence: true
  # validates :address, presence: true
end
