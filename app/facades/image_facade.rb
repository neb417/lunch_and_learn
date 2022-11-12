class ImageFacade
  def self.return_images(country)
    ImageService.call_for_images(country)
  end
end