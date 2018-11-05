class Family < ApplicationRecord

  has_secure_password
  
  has_many :users
  has_many :children
  has_many :others
  
  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :children
end
