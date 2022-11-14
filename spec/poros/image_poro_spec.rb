require 'rails_helper'

RSpec.describe ImagePoro do
  it 'has attributes' do
    hash = {
      id: 'zGuwHRohI8Y',
      created_at: '2022-05-26T08:30:04Z',
      updated_at: '2022-11-12T08:29:01Z',
      promoted_at: nil,
      width: 5295,
      height: 3456,
      color: '#8c7359',
      blur_hash: 'LCG*fw~S56Io0LafxajaMyxGkDj]',
      description: 'Spider by Craig Manners',
      alt_description: nil,
      urls:
        { 
          raw:
         'https://images.unsplash.com/photo-...',
          full:
         'https://images.unsplash.com/photo-...' 
        }
    }
    
    image = ImagePoro.new(hash)
    expect(image.image_title).to eq(hash[:description])
    expect(image.image_url).to eq(hash[:urls][:full])
  end
end