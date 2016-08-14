class Admin::UsersController < ApplicationController

  layout "admin"

  before_action :correct_user, only: [:edit, :index]
  before_action :authenticate_user!
  before_action :is_admin?

  def index
    @users = User.all
  end

  def update
    id = params["edit_user"]
    user = User.find(id)
    if user.update(user_params)
      flash[:notice] = "更新成功!"
      redirect_to admin_users_path
    end
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
