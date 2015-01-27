class WorkOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_phone_num, only: [:new]
  before_action :save_and_update, only: [:create, :update]

  def index
    if can? :read, :all
      @work_orders = WorkOrder.all.order(updated_at: :desc)
      if params[:content] != "" && params[:content] != nil
        user = User.find_by_username(params[:content])
        @work_orders = @work_orders.where(:user_id => user)
      end
    else
      @work_orders = WorkOrder.where(:user_id => current_user.id).order(updated_at: :desc)
    end

    if params[:commit] == "已解决"
      @work_orders = @work_orders.where(:status => "true")
    elsif params[:commit] == "未解决"
      @work_orders = @work_orders.where(:status => "false")
    elsif params[:commit] == "一周"
      @work_orders = @work_orders.where("created_at >= ?", 1.week.ago)
    elsif params[:commit] == "一月"
      @work_orders = @work_orders.where("created_at >= ?", 1.month.ago)
    elsif params[:commit] == "三天"
      @work_orders = @work_orders.where("created_at >= ?", 3.days.ago)
    end
  end

  def export
    @work_orders = WorkOrder.all.order(updated_at: :desc)

    respond_to do |format|
      format.html
      @work_orders.to_xls
      # format.xls { send_data @work_orders.to_xls}
      # format.xls { send_data @work_orders.to_xls, content_type: 'application/vnd.ms-excel', filename: 'work_orders.xls' }
      format.xls { send_file File.new('work_orders.xls') }
    end
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
      # @customer = Customer.find_by_phone_num(@tel) 可以通过工单获取
      @history_work_orders = WorkOrder.where(customer_id: @work_order.customer.id).order(created_at: :desc)
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
    redirect_to work_orders_path
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
    return id != nil ? WorkOrder.find(id) : WorkOrder.new
  end

  def initialize_customer_question(id)
    return id==0 ? CustomerQuestion.new : CustomerQuestion.find(id)
  end

  def save_and_update
    customer = initialize_customer(params[:work_order][:customer][:phone_num])
    customer.save(params[:work_order][:customer])
    #创建工单
    workorder = initialize_work_order(params[:id])
    workorder.save_and_update(params[:work_order], customer, current_user)

    # 创建问题表
    customer_questions = params[:work_order][:customer_questions_attributes]
      if customer_questions!=nil
        customer_questions.each do |question|
          unless question[1][:title].blank?
            customer_question = initialize_customer_question(question[1][:id].to_i)
            customer_question.save(question[1], workorder.id)
          end
        end
      end
  end
end