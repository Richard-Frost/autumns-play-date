class Playdate < ApplicationRecord

  has_many :participants  
  has_many :children, through: :participants
  has_many :comments

  geocoded_by :zip_code
  after_validation :geocode

  def zip_code
    zipcode
  end
  
  def self.originator=(params)
    self.originator = session[:family_id]
  end

  def date
    self.datetime.to_date
  end

end
