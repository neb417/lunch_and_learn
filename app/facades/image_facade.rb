class ImageFacade
  def self.return_images(country)
    images = ImageService.call_for_images(country)
    images[:results].map do |image|
      ImagePoro.new(image)
    end
  end
end
