class Child < ApplicationRecord
  
  scope :i_am_bored, -> { where(bored: true) }
  
  belongs_to :family
  has_many :participants  
  has_many :playdates, through: :participants
  has_many :messages

  def playdate_today
    self.playdates.where(datetime: Date.today.beginning_of_day..Date.today.end_of_day).order(datetime: :asc)
  end 

  def upcoming_playdates
    self.playdates.where("datetime > ?", Date.today.end_of_day).order(datetime: :asc)
  end

end
