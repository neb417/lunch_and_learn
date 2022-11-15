class MediaSenderJob
  include Sidekiq::Job

  def perform(country)
    ImageFacade.return_images(country)
  end
end
