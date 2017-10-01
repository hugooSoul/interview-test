class AccountController < ApplicationController

  before_action :set_user
  before_action :authenticate_user!, only: [:update]
  before_action :authenticate_owner!, only: [:update]

  def index
  end

  def show
  end

  def update

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user }
        format.json { render :show }
      else
        format.html { redirect_to @user, notice: "Something went wrong" }
        format.json { render json: @user.errors }
        flash[:notice] = @user.errors
      end
    end

  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def authenticate_owner!
    if current_user != @user
      redirect_to root_path, notice: "You dont have permitions", status: :unauthorized
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :first_last_name, :second_last_name,
                                  :password, :password_confirmation, :phonenumber, :gender, :birth_date)
  end

end
