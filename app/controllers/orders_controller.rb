class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new(product: @product, user: current_user)
    if @order.save
      redirect_to products_path, notice: 'La orden ha sido ingresada'
    else
      redirect_to products_path, alert: 'La orden no ha sido ingresada'
    end
    
  end

  def index
    @orders = current_user.orders
  end
end
