class RecipeFacade
  def self.return_recipes(country)
    recipes = RecipeService.call_for_recipes(country)
    recipes[:hits].map do |recipe|
      RecipePoro.new(recipe)
    end
  end
end