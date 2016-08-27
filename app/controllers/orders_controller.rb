class OrdersController < ApplicationController

  layout "application"

  before_action :authenticate_user!
  before_action :find_user
  before_action :find_order, only: [:show, :edit, :update, :checked_order]

  def index
    @orders = @user.orders
    current_user_id = current_user.id
    @customer_orders = @orders.where(:tour_guide_id => current_user_id)
  end

  def new
    tour_guide_ids = UserRoleShip.all.where(:role_id => 2).pluck(:user_id)
    @tour_guide = User.all.where(:id => tour_guide_ids)
    
    @checked_tour_guide_id = params[:user_id]
    
    @user = current_user
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    if params[:role] == "traveler"
      @role = "traveler"
    elsif params[:role] == "tour-guide"
      @role = "tour-guide"
    end
  end

  def edit
    tour_guide_ids = UserRoleShip.all.where(:role_id => 2).pluck(:user_id)
    @tour_guide = User.all.where(:id => tour_guide_ids)
    
    @checked_tour_guide_id = params[:user_id]
    
    @user = current_user
    @order = Order.find(params[:id])
  end

  def create
    group_id = Time.now.to_i
    
    while Order.find_by(:group_id => group_id)
      group_id = Time.now.to_i + 123
    end

    @tour_guide_ids = params[:order][:tour_guide_ids].reject {|e| e.blank?}

    for tour_guide_id in @tour_guide_ids
      @user = current_user
      @order = @user.orders.create(order_params)
      @order.tour_guide_id = tour_guide_id
      @order.group_id = group_id
      @order.save!

      if !@order.save!
        redirect_to :new
      end
    end 

    redirect_to events_path

  end

  def update
    if params[:order] && @order.update(order_params)
      flash[:notice] = "更新成功!"
      redirect_to user_orders_path(@user)
    
    elsif params[:status] && params[:status] == "accept"
      @order.status =  "accept"
      @order.save!
      group_id = @order.group_id
      orders = Order.where(:group_id => group_id, :status => nil)
      orders.update_all(:status => "cancel")
      redirect_to user_order_path(@user,@order, :role=>"tour-guide")
    else
      render "edit"
    end
  end

  def destroy
    
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :tour_guide_id, :finished,
                                  :user_prefer_date, 
                                  :final_date, :user_prefer_place,
                                  :final_place, :note, 
                                  :country, :phone_number,
                                  :name, :email, :language, :people_count,
                                  :request_days, :purpose, :others,
                                  :skype_id, :gender, :birthday,
                                  :interest_ids =>[],
                                )
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_order
    @order = Order.find(params[:id])
  end
end
