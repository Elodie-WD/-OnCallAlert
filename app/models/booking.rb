class Booking < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :date, uniqueness: { scope: :on_call, if: :on_call?,
    message: " non valide : Astreinte déjà attribuée"  }
  validates :date, uniqueness: { scope: :on_call, unless: :on_call?,
    message: " non valide : Garde déjà attribuée"  }
end
