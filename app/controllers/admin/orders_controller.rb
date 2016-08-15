class Admin::OrdersController < ApplicationController

  layout "admin"

  before_action :correct_user, only: [:edit, :index]
  before_action :authenticate_user!
  before_action :is_admin?

  def index
    @orders = Order.all
  end

  private

  def is_admin?
    @user = current_user
    @user.roles.pluck('name').include? "admin"
  end

  def user_params
    params.require(:user).permit(:role_ids=>[]
                                )
  end

  def correct_user
    @user = current_user
  end
end
