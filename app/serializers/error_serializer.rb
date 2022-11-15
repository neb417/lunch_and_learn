class ErrorSerializer
  def self.error_serializer(message, input)
    {
      "data":
        {
          "message": "Country input '#{input}' #{message[:message].downcase}"
        }
    }
  end

  def self.error_credentials_serializer
    {
      "error": 'Invalid credentials'
    }
  end

  def self.error_user_serializer(message)
    {
      'data': message.to_sentence
    }
  end
end
