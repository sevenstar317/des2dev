class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end

  private

    def images_attributes
      return {} if params[:images_attributes].blank?
      images_attributes = params[:images_attributes].first.to_hash.values.map do |file|
        { file: file }
      end
      { images_attributes: images_attributes }
    end
end
