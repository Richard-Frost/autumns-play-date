class Parent < ApplicationRecord
  has_secure_password
  belongs_to :family
end
