class User < ApplicationRecord

  def generate_api
    SecureRandom.urlsafe_base64
  end
end
