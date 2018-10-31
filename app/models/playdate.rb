class Playdate < ApplicationRecord
  has_many :participants  
  has_many :children, through: :participants
end
