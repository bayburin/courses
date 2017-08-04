class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  layout :layout

  # Определяем, какой layout выводить: для входа в систему или основной
  def layout
    is_a?(Devise::SessionsController) || is_a?(Devise::RegistrationsController) || is_a?(Devise::ConfirmationsController) ? 'sign_in_app' : 'application'
  end
end
