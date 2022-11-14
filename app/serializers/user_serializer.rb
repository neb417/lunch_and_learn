class UserSerializer
  def self.serialize_user(user)
    {
      "data": {
        "type": 'user',
        "id": user.id,
        "attributes": {
          "name": user.name,
          "email": user.email,
          "api_key": user.api_key
        }
      }
    }
  end
end
