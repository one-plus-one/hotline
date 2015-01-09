class CustomersController < ApplicationController

  def create
    # @customer = Customer.new(params[:customer])
    # @customer.save
    customer  = Customer.new
    customer.name = params[:customer][:name]
    customer.age = params[:customer][:age]
    customer.disability_degree = params[:customer][:disability_degree]

    customerQestion = CustomerQuestion.new
    customerQestion.title = params[:customer][:title]
    customerQestion.answer = params[:customer][:answer]
    customerQestion.note = params[:customer][:note]
    customerQestion.save

    #电话号码获取不到
    num = @tel
    customer.phone_num = "num"

    customer.save
    redirect_to dashboard_home_path
  end


  private
  def customer_params
    params.require(:customer).permit(:name, :age, :disability_degree, :education, :occupation, :marital_status, :marital_status, :address_type, :channel)
  end
end
