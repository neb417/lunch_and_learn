require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user validations' do
    it { should validate_uniqueness_of(:email) }
    it { should have_many :favorites }
  end
end
