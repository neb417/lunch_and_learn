require 'rails_helper'

RSpec.describe 'Favorites Post Request' do
  describe 'uses passed favorite info to return add to user' do
    let!(:user) { create :user }
    before :each do
      post api_v1_favorites_path, params: {
        country: 'thailand',
        recipe_link: 'https://www.tastingtable.com/.....',
        recipe_title: 'Crab Fried Rice (Khaao Pad Bpu)',
        api_key: user.api_key
      }
    end

    it 'posts to favorites' do
      expect(request.POST.empty?).to be false
      expect(request.GET.empty?).to be true
      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.body).to be_a String
      expect(response.body).to eq("{\"success\":\"Favorite added successfully\"}")
    end
  end

  describe 'sends error message when api_key not valid' do
    let!(:user) { create :user }
    before :each do
      post api_v1_favorites_path, params: {
        country: 'thailand',
        recipe_link: 'https://www.tastingtable.com/.....',
        recipe_title: 'Crab Fried Rice (Khaao Pad Bpu)',
        api_key: 'm0cthmgiy1v7bf2yx9pfsw'
      }
    end

    it 'sends error' do
      error = JSON.parse(response.body, symbolize_names: true)
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(error).to eq({ error: 'Invalid credentials' })
    end
  end
end
