class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      #user.remember_me = true
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      return
    end

    session["devise.auth"] = request.env["omniauth.auth"]

    render :edit

  end

  def failure
    redirect_to new_user_session_path, notice: "Something went wrong, try again!"
  end

  def custom_sign_up
    @user = User.from_omniauth(session['devise.auth'])
    if @user.update(user_params)
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :second_name, :first_last_name, :second_last_name, :email, :gender, :birth_date)
  end

end
