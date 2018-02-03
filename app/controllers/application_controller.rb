class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locales

  def set_locales
    I18n.locale = locale
  end

  private

  def locale
    @locale ||= params[:locale] || I18n.default_locale
  end
end
