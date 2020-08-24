class OrdersController < ApplicationController

  def index
  end

  def create
    @order = Order.new
    if @order.create
      pay_item
      return redirect_to root_path
    else
      render 'index'
    end
  end
  
  private

  def order_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      card: order_params[:token],    # カードトークン  
  end

end
