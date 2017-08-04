class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  layout :layout

  rescue_from Pundit::NotAuthorizedError do |exception|
    respond_to do |format|
      format.html { render_403 }
      format.json { render json: { full_message: 'Доступ запрещен' }, status: 403 }
    end
  end

  def render_403
    render file: Rails.root.join('public', '403.html'), status: 403, layout: false
  end

  # Определяем, какой layout выводить: для входа в систему или основной
  def layout
    is_a?(Devise::SessionsController) || is_a?(Devise::RegistrationsController) || is_a?(Devise::ConfirmationsController) ? 'sign_in_app' : 'application'
  end
end
