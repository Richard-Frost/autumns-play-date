class Message < ApplicationRecord
  belongs_to :child
  belongs_to :user
  has_many :messages
end
