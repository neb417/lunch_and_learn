class ImagePoro
  attr_reader :image_title, :image_url

  def initialize(data)
    @image_title = data[:description]
    @image_url = data[:urls][:full]
  end
end
