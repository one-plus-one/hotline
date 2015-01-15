class WorkOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_phone_num, only: [:new]

  def index
    @work_orders = WorkOrder.where(:user_id => current_user.id)
  end

  def new
    @work_order = WorkOrder.new
    @work_order.customer_questions = [CustomerQuestion.new]
    @work_order.customer = initialize_customer(@tel)
    #显示历史记录
    #通过电话号码取得customerID
    #通过customerID取得工单号
    #通过工单号取得问题(需要注意的问题就是一个工单原则上是可以有多条信息的)
    if @work_order.customer.id != nil
      @customer = Customer.find_by_phone_num(@tel)
      @history_work_orders = WorkOrder.where(customer_id: @customer.id).order(created_at: :desc)
      @arrays = Array.new
      @history_work_orders.each do |history_work_order|
        history_questions = CustomerQuestion.where(work_order_id: history_work_order.id).order(created_at: :desc)
        history_questions.each do |history_question|
          @arrays.push(history_question)
        end
      end
    end
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
      workOrder=(id!=nil) ? WorkOrder.find(id) : WorkOrder.new
      return workOrder
    end

    def initialize_customer_question(id)
      question=(id==0) ? CustomerQuestion.new : CustomerQuestion.find(id)
      return question
    end

    def save_and_update
      customer = initialize_customer(params[:work_order][:customer][:phone_num])
      customer.save(params[:work_order][:customer])
      #创建工单
      workorder = initialize_work_order(params[:id])
      workorder.save(params[:work_order], customer, current_user)


      # 创建问题表
      customer_questions = params[:work_order][:customer_questions_attributes]
      if customer_questions != nil
        customer_questions.each do |question|
          customer_question = initialize_customer_question(question[1][:id].to_i)
          customer_question.save(question[1], workorder.id)
        end
      end
    end
  end