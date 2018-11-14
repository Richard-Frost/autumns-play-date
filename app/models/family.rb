class Family < ApplicationRecord
  
  has_many :users
  has_many :children
  has_many :others
  
  has_many :family_connections
  #has_many :friendships
  has_many :famconnects, through: :family_connections
 #has_many :friends, through: :friendships
  
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :children
end
