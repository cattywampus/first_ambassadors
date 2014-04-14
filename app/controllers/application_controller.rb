class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authenticate_ambassador_from_token!
    email = params[:ambassador_email].presence
    ambassador = email && Ambassador.find_by(email: email)

    if ambassador && Devise.secure_compare(ambassador.authentication_token, params[:ambassador_token])
      sign_in ambassador, store: false
    end
  end
end
