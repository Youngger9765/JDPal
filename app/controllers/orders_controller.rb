class OrdersController < ApplicationController

  layout "application"

  before_action :authenticate_user!
  before_action :find_user

  def index
    @orders = @user.orders
    current_user_id = current_user.id
    @customer_orders = @orders.where(:tour_guide_id => current_user_id)
  end

  def new
    @tour_guide = User.all
    @user = current_user
    @order = Order.new
  end

  def show
    
  end

  def create
    @tour_guide_ids = params[:order][:tour_guide_ids].reject {|e| e.blank?}

    for tour_guide_id in @tour_guide_ids
      @user = current_user
      @order = @user.orders.create(order_params)
      @order.tour_guide_id = tour_guide_id
      @order.save!

      if !@order.save!
        redirect_to :new
      end
    end 

    redirect_to events_path

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

  def find_user
    @user = User.find(params[:user_id])
  end
end
