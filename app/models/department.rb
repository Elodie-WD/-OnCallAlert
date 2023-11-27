class Department < ApplicationRecord
  belongs_to :hospital
  has_many :users
  
end
