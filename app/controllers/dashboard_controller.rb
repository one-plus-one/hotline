class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :require_tel, only: [:oncall, :workorder]
  def home
  end

  def help
  end


  def oncall

  end

  def workorder

  end

  private
  def require_tel
    @tel = params[:tel]
  end
end