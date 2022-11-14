class FavoriteSerializer
  def self.serialize_favorite
    {
      "success": 'Favorite added successfully'
    }
  end

  def self.error_serializer
    {
      "error": 'Invalid credentials'
    }
  end
end