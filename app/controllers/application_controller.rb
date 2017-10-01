class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
    welcome_path
  end

  def after_sign_up_path_for(resource)
    #WelcomeMailer.welcome_email(resource).deliver_now
    welcome_path
  end

end
