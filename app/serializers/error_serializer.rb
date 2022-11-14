class ErrorSerializer
  def self.error_seralizer(message, input)
    {
      "data":
        {
          "message": "Country input '#{input}' #{message[:message].downcase}"
        }
    }
  end
end
