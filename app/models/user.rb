class User < ApplicationRecord
  has_secure_password

  def self.from_omniauth(auth)
    email = auth[:info][:email] || "#{auth[:uid]}@facebook.com"
    user = where(email: email).first_or_initialize

    user.save && user
  end
end
