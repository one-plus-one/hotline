class WorkorderController < ApplicationController
  def index
    @workorders = WorkOrder.where("users_id = ?",current_user.id)
  end

  def edit
    @workorder = WorkOrder.find(params[:id])
    @customer = Customer.find(@workorder.customer_id)
  end

  def update

    redirect_to workorder_index_path
  end
end
