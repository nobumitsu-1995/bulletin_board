class User < ApplicationRecord
  has_secure_password
  has_many :posts

  def self.find_or_create_account(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:info][:nickname]
    image = auth[:info][:image]
    email = auth[:uid]
    password_digest = auth[:uid]

    self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.name = name
      user.email = email
      user.password_digest = password_digest
      user.image = image
    end
  end

end
