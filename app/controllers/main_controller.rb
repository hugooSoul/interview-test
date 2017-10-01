class MainController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
  end

  def welcome
    @user = current_user
    if @user.birth_date == nil || @user.gender == nil || @user.phonenumber == nil || @user.first_last_name == nil || @user.second_last_name == nil
      @message = "missing"
    else
      @message = "complete"
    end

    @requisition = @user.requisitions
  end

  private

end
