class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false
  has_secure_password
  has_many :favorites

  def generate_api
    SecureRandom.urlsafe_base64
  end
end
