class PersonalreferencesController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :set_requisition
  before_action :set_reference, except: [:new, :create]

  def new
    @personalreference = @requisition.personalreferences.build
  end

  def create
    @personalreference = @requisition.personalreferences.build(references_params)
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end


  private

  def set_reference
    @personalreference = @requisition.personalreferences.find(params[:id])
  end

  def set_requisition
    @requisition = Requisition.find(params[:requisition_id])
  end

  def references_params
    params.require(:personalreference).permit(:first_name, :second_name, :first_last_name, :second_last_name, :cell_phone_number)
  end

end
