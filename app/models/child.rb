class Child < ApplicationRecord
  scope :i_am_bored, -> { where(bored: true) }
  scope :not_bored, -> { where(bored: false) }

  belongs_to :family
  has_many :participants  
  has_many :playdates, through: :participants

end
