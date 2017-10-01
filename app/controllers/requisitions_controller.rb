class RequisitionsController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :set_requisition, only: [:show, :edit, :update, :destroy]

  def new
    @requisition = Requisition.new
  end

  def create
    @requisition = current_user.requisitions.build(requisition_params)

    respond_to do |format|
      if @requisition.save
        format.html { redirect_to welcome_path, flash: { success: "Your requisition has been created" } }
        format.json { render :edit, status: :ok, location: @requisition }
      else
        format.html { redirect_to :new_requisition, flash: { notice: "Something went wrong" }}
        format.json { render json: @requisition.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @requisition.update(requisition_params)
        format.html { redirect_to welcome_path, flash: { notice: t('flash_messages.rooms.updated')} }
        format.json { render :edit, location: @requisition }
      else
        format.html { render :edit }
        flash[:notice] = t('flash_messages.error')
        format.json { render :edit, status: :unprocessable_entity, location: @requisition }
      end
    end #end response
  end

  def destroy
    @requisition.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      flash[:alert] = "The requisition has been deleted"
      format.json { head :no_content }
    end
  end


  private

  def set_requisition
    @requisition = Requisition.find(params[:id])
  end

  def requisition_params
    params.require(:requisition).permit(:incomes, :marital_status, :requested_amount, :payment_terms,
      :comment, :company_name, :company_position, :company_phone_number,
      personalreferences_attributes: [:id, :first_name, :second_name, :first_last_name, :second_last_name, :cell_phone_number, :_destroy])
  end

end
