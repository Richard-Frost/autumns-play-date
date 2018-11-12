class User < ApplicationRecord
  has_secure_password
  belongs_to :family

  def send_family_invite
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.family_invite(self).deliver!
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver!
  end

  def generate_token(column)
      self.password_reset_token = SecureRandom.urlsafe_base64
  end 
  
  
end
