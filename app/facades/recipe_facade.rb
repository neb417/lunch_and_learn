class RecipeFacade
  def self.return_recipes(country)
    recipes = RecipeService.call_for_recipes(country)
  end
end