class Child < ApplicationRecord
  belongs_to :family
  has_many :participants  
  has_many :playdates, through: :participants
end
