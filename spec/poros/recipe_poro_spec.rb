require 'rails_helper'

RSpec.describe RecipePoro do
  it 'has attributes' do
    hash = {
      recipe: {
        uri: 'http://www.edamam.com/ontologies/edamam.owl#recipe_...',
        label: 'Nsima',
        image:
        'https://edamam-product-images.s3.amazonaws.com/web-img/...'
      }
    }
    recipe = RecipePoro.new(hash)
    expect(recipe.url).to eq(hash[:recipe][:uri])
    expect(recipe.title).to eq(hash[:recipe][:label])
    expect(recipe.image).to eq(hash[:recipe][:image])
  end
end