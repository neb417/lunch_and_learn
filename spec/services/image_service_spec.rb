require 'rails_helper'

RSpec.describe ImageService do
  describe 'call_for_images' do
    it 'returns a video' do
      images = ImageService.call_for_images('Malawi')

      expect(images).to be_a Hash
      expect(images).to have_key(:results)
      expect(images[:results]).to be_an Array
      expect(images[:results].count).to be <= 10
      image = images[:results].first
      expect(image).to have_key(:id)
      expect(image[:id]).to be_an String
      expect(image).to have_key(:description)
      expect(image[:description]).to be_a String
      expect(image).to have_key(:urls)
      expect(image[:urls]).to be_a Hash
      expect(image[:urls]).to have_key(:full)
      expect(image[:urls][:full]).to be_a String
    end
  end
end