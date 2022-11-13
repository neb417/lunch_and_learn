class User < ApplicationRecord
  validates_uniqueness_of :email

  def generate_api
    SecureRandom.urlsafe_base64
  end
end
