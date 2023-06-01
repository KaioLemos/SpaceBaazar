class OrdersController < ApplicationController
    def index
        @orders = policy_scope(current_user.orders)
        authorize @orders
    end
    def create
        @order = Order.new(order_params)
        @part = @order.part
        if @order.save
            @part.completed = true
            @part.save
            redirect_to orders_path
        else
            render :new
        end
    end
    def show
        @order = Order.find(params[:id])
    end

    private
    def order_params
        params.require(:order).permit(:user_id, :part_id, :completed)
    end
end
