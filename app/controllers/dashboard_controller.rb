class DashboardController < ApplicationController
  before_action :authenticate_user!
  def home
  end

  def oncall
    @tel = params[:tel]
  end

  def answer
    redirect_to new_work_order_path(:phone_num => params[:tel])
  end

end