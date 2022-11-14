FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.safe_email }
    api_key { SecureRandom.urlsafe_base64 }
  end
end
