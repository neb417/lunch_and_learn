class ApplicationController < ActionController::API

  def generate_country
    if params[:country].present?
      @country ||= CountryFacade.return_country(params[:country])
    else
      @country ||= CountryFacade.select_country
    end
  end
end
