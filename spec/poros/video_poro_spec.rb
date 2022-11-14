require 'rails_helper'

RSpec.describe VideoPoro do
  it 'has attributes' do
    id = 15
    hash = {
      items:
      [
        {
          snippet: { title: 'A Super Quick History of Malawi'}
        }
      ]
    }

    video = VideoPoro.new(hash, id)
    expect(video.title).to eq(hash[:items].first[:snippet][:title])
    expect(video.id).to eq(id)
  end
end
