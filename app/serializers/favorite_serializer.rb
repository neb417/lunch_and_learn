class FavoriteSerializer
  def self.serialize_favorite
    {
      "success": 'Favorite added successfully'
    }
  end

  def self.serialize_user_favorites(favs)
    {
      "data": favs.map do |fav|
          {
            "id": fav.id,
            "type": 'favorite',
            "attributes": {
              "recipe_title": fav.recipe_title,
              "recipe_link": fav.recipe_link,
              "country": fav.country,
              "created_at": fav.created_at
            }
          }
              end
    }
  end

  def self.serialize_delete_favorite
    {
      "data": {
        "success": 'Favorite successfully removed'
      }
    }
  end
end
