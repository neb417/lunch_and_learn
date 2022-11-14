class ErrorSerializer
  def self.error_serializer(message, input)
    {
      "data":
        {
          "message": "Country input '#{input}' #{message[:message].downcase}"
        }
    }
  end
end
