require 'rails_helper'

RSpec.describe 'Favorites Post Request' do
  describe 'uses passed favorite info to return add to user' do
    let!(:users) { create_list :user, 3 }
    let!(:user1) { users.first }
    let!(:user2) { users.second }
    let!(:user3) { users.last }

    let!(:fav1) { create :favorite, user_id: user1.id }
    let!(:fav2) { create :favorite, user_id: user1.id }
    let!(:fav3) { create :favorite, user_id: user2.id }

    before :each do
      get api_v1_favorites_path, params: {
        api_key: user1.api_key
      }
    end

    it 'returns successful response' do
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.body).to be_a String
    end

    it 'returns recipe favorites of a user' do
      recipes = JSON.parse(response.body, symbolize_names: true)
      expect(recipes).to have_key(:data)
      expect(recipes[:data]).to be_an Array
      recipe = recipes[:data].first
      expect(recipe).to have_key(:id)
      expect(recipe).to have_key(:type)
      expect(recipe).to have_key(:attributes)
      expect(recipe[:attributes]).to have_key(:recipe_title)
      expect(recipe[:attributes]).to have_key(:recipe_link)
      expect(recipe[:attributes]).to have_key(:country)
      expect(recipe[:attributes]).to have_key(:created_at)
    end

    it 'returns correct favorite recipes' do
      recipes = JSON.parse(response.body, symbolize_names: true)
      recipes = recipes[:data]
      all_favs = Favorite.all
      expect(recipes.count).to eq 2
      expect(recipes.count).to be < all_favs.count
    end
  end
end