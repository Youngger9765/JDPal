class UsersController < ApplicationController

  layout "application"

  before_action :correct_user, only: [:edit, :update]
  before_action :authenticate_user!, except: [:index, :clause, :contact, :send_mail]
  before_action :find_user, only: [:show, :edit, :update, :upload]
  
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)

      flash[:notice] = "更新成功!"
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def destroy
  end

  private

  def find_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :nick_name, :profession, :head_shot,
                                 :description_English, :description_Chinese,
                                 :availability, :travel_footprints,
                                 :familiar_areas, :facebook_url,
                                )
  end

  def correct_user
    @user = current_user
  end

end
