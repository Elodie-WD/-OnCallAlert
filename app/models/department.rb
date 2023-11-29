class Department < ApplicationRecord
  belongs_to :hospital
  has_many :users, dependent: :destroy
end
