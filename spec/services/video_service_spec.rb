require 'rails_helper'

RSpec.describe VideoService do
  describe 'call_for_video', :vcr do
    it 'returns a video' do
      video = VideoService.call_for_video('Malawi')

      expect(video).to be_a Hash
      expect(video).to be_a Hash
      expect(video).to have_key(:kind)
      expect(video[:kind]).to be_an String
      expect(video).to have_key(:pageInfo)
      expect(video[:pageInfo]).to be_an Hash
      expect(video).to have_key(:items)
      expect(video[:items]).to be_an Array
      expect(video[:items].count).to eq(1)
    end

    it 'returns empty items when no video[:items] are returned' do
      video = VideoService.call_for_video('iugnw')

      expect(video).to be_a Hash
      expect(video).to have_key(:kind)
      expect(video[:kind]).to be_an String
      expect(video).to have_key(:pageInfo)
      expect(video[:pageInfo]).to be_an Hash
      expect(video).to have_key(:items)
      expect(video[:items]).to be_an Array
      expect(video[:items].empty?).to be true
    end
  end

  describe 'call_for_video_details', :vcr do
    it 'returns title of video' do
      video_id = 'QcJowpMp5qQ'
      video = VideoService.call_for_video_details(video_id)

      expect(video).to be_a Hash
      expect(video).to have_key(:items)
      expect(video[:items]).to be_an Array
      expect(video[:items].count).to eq(1)

      info = video[:items].first

      expect(info).to have_key(:snippet)
      expect(info[:snippet]).to be_an Hash
      expect(info[:snippet]).to have_key(:title)
      expect(info[:snippet][:title]).to be_an String
    end

    it 'returns emptry if video not found' do
      video_id = '98uoibjk'
      video = VideoService.call_for_video_details(video_id)

      expect(video).to be_a Hash
      expect(video).to have_key(:items)
      expect(video[:items]).to be_an Array
      expect(video[:items].empty?).to be true
    end
  end
end
