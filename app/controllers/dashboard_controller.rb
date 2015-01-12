class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :require_tel, only: [:oncall, :workorder, :create]
  def home
  end

  def help
  end


  def oncall

  end

  def workorder
    @customer = Customer.find_by_phone_num(params[:tel])
    if @customer == nil
      @customer = Customer.new
      @customer.phone_num=params[:tel]
      @customer.save!
    end
  end

  def create
    customer  = Customer.find_by_id(params[:workorder][:id])
    customer.save(params[:workorder])

    #创建工单
    workorder = WorkOrder.new
    workorder.save(params[:workorder],customer,current_user)

    # 创建问题表
    customerQestion = CustomerQuestion.new
    customerQestion.save(params[:workorder],workorder)

    redirect_to dashboard_home_path
  end

  private
  def require_tel
    @tel = params[:tel]
  end
end