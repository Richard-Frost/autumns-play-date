class Family < ApplicationRecord
  
  has_many :users
  has_many :children
  has_many :others
  has_many :requests
  
  has_many :family_connections
  #has_many :friendships
  has_many :famconnects, through: :family_connections
 #has_many :friends, through: :friendships
  
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :children

  geocoded_by :zip_code
  after_validation :geocode

  def zip_code
    zipcode
  end
  
end
