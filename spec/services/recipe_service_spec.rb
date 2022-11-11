require 'rails_helper'

RSpec.describe RecipeService do
  it 'returns recipes' do
    recipes = RecipeService.call_for_recipes('Malawi')

    expect(recipes).to be_a Hash
    expect(recipes).to be_a Hash
    expect(recipes).to have_key(:count)
    expect(recipes[:count]).to be_an Integer
    expect(recipes).to have_key(:hits)
    expect(recipes[:hits]).to be_an Array
    expect(recipes[:hits].count).to be <= 20

    recipe = recipes[:hits].first

    expect(recipe).to be_a Hash
    expect(recipe).to have_key(:recipe)
    expect(recipe).to be_a Hash
    expect(recipe[:recipe]).to have_key(:uri)
    expect(recipe[:recipe]).to have_key(:label)
    expect(recipe[:recipe]).to have_key(:image)
  end
end
