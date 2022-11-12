require 'rails_helper'

RSpec.describe VideoService do
  it 'returns a video', :vcr do
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