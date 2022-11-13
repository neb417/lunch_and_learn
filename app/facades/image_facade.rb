class ImageFacade
  def self.return_images(country)
    images = ImageService.call_for_images(country)
    images[:results].map do |image|
      {
        image_title: image[:description],
        image_url: image[:urls][:full]
      }
      # image_title, image_url = [image[:description], image[:urls][:full]]
    end
  end
end