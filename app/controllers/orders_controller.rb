class OrdersController < ApplicationController
    def index
        @orders = current_user.orders
    end

    def new
      @order = Order.new(order_params)
      @part = @order.part
    end

    def create
      @order = Order.new(order_params)
      @part = @order.part
      if @order.save
        @part.completed = true
        @part.save
        redirect_to orders_path
      else
        redirect_to orders_path
      end
    end
    def show
        @order = Order.find(params[:id])
    end

    def destroy
      @order = Order.find(params[:id])
      @order.destroy
    end

    private
    def order_params
        params.require(:order).permit(:user_id, :part_id, :completed)
    end
end
