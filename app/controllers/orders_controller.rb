class OrdersController < ApplicationController

  layout "application"

  before_action :authenticate_user!

  def index
    
  end

  def new
    @tour_guide = User.find(params["user_id"])
    @user = current_user
    @order = Order.new
  end

  def show
    
  end

  def create

    @tour_guide = User.find(params["user_id"])
    @user = current_user
    @order = @user.orders.create(order_params)
    @order.tour_guide_id = @tour_guide.id
    
    if @order.save!
      redirect_to events_path
    else
      redirect_to :new
    end 
  end

  def update
    
  end

  def destroy
    
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :tour_guide_id, :finished,
                                  :contacted, :user_prefer_date, 
                                  :final_date, :user_prefer_place,
                                  :final_place, :note
                                )
  end
end
