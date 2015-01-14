class WorkOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_phone_num, only: [:new]
  before_action :save_and_update, only: [:create, :update]

  def index
    @work_orders = WorkOrder.where(:user_id => current_user.id)
  end

  def new
    @work_order = WorkOrder.new
    @work_order.customer_questions = [CustomerQuestion.new]
    @work_order.customer = initialize_customer(@tel)
  end

  def create
    redirect_to dashboard_home_path
  end

  def update
    redirect_to dashboard_home_path
  end

  def edit
    id = params[:id]
    @work_order = WorkOrder.find(id)
    @work_order.customer_questions = CustomerQuestion.where(:work_order_id => id)
  end

  private
  def require_phone_num
    @tel = params[:phone_num]
  end

  def initialize_customer(phone_num)
    return Customer.find_by_phone_num(phone_num) || Customer.new
  end

  def initialize_work_order(id)
    if id==nil
      return WorkOrder.find(id)
    else
      return WorkOrder.new
    end
  end

  def initialize_customer_question(id)
    if id==0
      return CustomerQuestion.new
    else
      return CustomerQuestion.find(id)
    end
  end

  def save_and_update
    customer  = initialize_customer(params[:work_order][:customer][:phone_num])
    customer.save(params[:work_order][:customer])
    #创建工单
    workorder = initialize_work_order(params[:id])
    workorder.save(params[:work_order],customer,current_user)


    # 创建问题表
    customer_questions = params[:work_order][:customer_questions_attributes]
    if customer_questions != nil
      customer_questions.each  do |question|
        customer_question = initialize_customer_question(question[1][:id].to_i)
        customer_question.save(question[1],workorder.id)
      end
    end
  end
end