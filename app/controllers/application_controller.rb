class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(
        :account_update, keys: [
          :id_card, :first_name, :middle_name, :last_name, phone_attributes: [:number]
        ]
      )
    end
end
