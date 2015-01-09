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
    @id=@customer.id
  end

  def create
    customer  = Customer.find_by_id(params[:dashboard][:id])
    customer.name = params[:dashboard][:name]
    customer.age = params[:dashboard][:age]
    customer.gender = params[:dashboard][:gender]
    customer.disability_degree = params[:dashboard][:disability_degree]
    customer.education = params[:dashboard][:education]
    customer.occupation = params[:dashboard][:occupation]
    customer.marital_status = params[:dashboard][:marital_status]
    customer.address = params[:dashboard][:address]
    customer.address_type = params[:dashboard][:address_type]
    customer.channel = params[:dashboard][:channel]
    customer.phone_num = params[:dashboard][:phone_num]
    customer.save

    #创建工单
    workorder = WorkOrder.new
    workorder.status = params[:dashboard][:status]
    workorder.customer_id = customer.id    #获取到当前的customerID
    workorder.users_id = current_user.id   #获取到当前的userID
    workorder.save

    # 创建问题表
    customerQestion = CustomerQuestion.new
    customerQestion.title = params[:dashboard][:title]
    customerQestion.answer = params[:dashboard][:answer]
    customerQestion.note = params[:dashboard][:note]
    customerQestion.work_order_id = workorder.id
    customerQestion.save

    redirect_to dashboard_home_path
  end

  private
  def require_tel
    @tel = params[:tel]
  end
end