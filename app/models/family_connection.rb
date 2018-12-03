class FamilyConnection < ApplicationRecord
  belongs_to :family
 #belongs_to :user
  belongs_to :famconnect, class_name: "Family"
 #belongs_to :friend, class_name: "User"
end
