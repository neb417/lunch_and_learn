require 'rails_helper'

RSpec.describe 'Session Post Request' do
  let!(:user) {
    post api_v1_users_path, params:
    {
      name: 'Athena Dao',
      email: 'athenadao@bestgirlever.com',
      password: 'password',
      password_confirmation: 'password'
    }
  }

  describe 'uses passed user info to return a user' do
    before :each do
      post api_v1_sessions_path, params:
        {
          email: 'athenadao@bestgirlever.com',
          password: 'password'
        }
    end

    it 'uses request body to create user' do
      expect(request.POST.empty?).to be false
      expect(request.GET.empty?).to be true
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.body).to be_a String
    end

    it 'returns correct information in response' do
      user = JSON.parse(response.body, symbolize_names: true)

      expect(user).to have_key(:data)
      expect(user[:data]).to have_key(:type)
      expect(user[:data][:type]).to eq('user')
      expect(user[:data]).to have_key(:id)
      expect(user[:data][:id]).to be_an Integer
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to be_a Hash
      expect(user[:data][:attributes]).to have_key(:name)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes]).to have_key(:api_key)
      expect(user[:data][:attributes][:name]).to be_a String
      expect(user[:data][:attributes][:email]).to be_a String
      expect(user[:data][:attributes][:api_key]).to be_a String
    end
  end

  describe 'invalid info passed for login' do
    it 'incorrect email' do
      post api_v1_sessions_path, params:
      {
        email: 'dao@bestgirlever.com',
        password: 'password'
      }
      error = JSON.parse(response.body, symbolize_names: true)
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(error[:error]).to eq('Invalid credentials')
    end

    it 'incorrect password' do
      post api_v1_sessions_path, params:
      {
        email: 'athenadao@bestgirlever.com',
        password: 'pa$$word'
      }
      error = JSON.parse(response.body, symbolize_names: true)
      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(error[:error]).to eq('Invalid credentials')
    end
  end
end
