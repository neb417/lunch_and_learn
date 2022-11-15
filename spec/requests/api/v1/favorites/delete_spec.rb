require 'rails_helper'

RSpec.describe 'Favorites Post Request' do
  let!(:users) { create_list :user, 3 }
  let!(:user1) { users.first }
  let!(:user2) { users.second }
  let!(:user3) { users.last }

  let!(:fav1) { create :favorite, user_id: user1.id }
  let!(:fav2) { create :favorite, user_id: user1.id }
  let!(:fav3) { create :favorite, user_id: user2.id }

  describe 'delete a user favorite' do
    it 'returns successful response' do
      expect(user1.favorites.count).to eq 2

      delete api_v1_favorite_path, params: {
        api_key: user1.api_key,
        favorite_id: fav1.id
      }

      expect(response).to be_successful
      expect(response.status).to eq(204)
      expect(response.body).to be_a String

      expect(user1.favorites.count).to eq 1
    end
  end
end
