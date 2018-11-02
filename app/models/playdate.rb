class Playdate < ApplicationRecord
  has_many :participants  
  has_many :children, through: :participants


  def self.originator=(params)
    self.originator = session[:family_id]
  end

end
