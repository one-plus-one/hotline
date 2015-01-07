class DashboardController < ApplicationController
  before_action :authenticate_user!
  def home
  end

  def help
  end


  def oncall
    @tel = params[:tel]
  end


  def workorder

  end
end