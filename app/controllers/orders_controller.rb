class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = ItemOrder.new
    
  end

  def new
    @order = ItmeOrder.new
  end

  def create
  
    @order = ItemOrder.new(order_params)
    if @order.valid?
      @order.save  
      return redirect_to root_path
    else
      render "index"    
    end
  end
  
  private

  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      card: order_params[:token]  
      )
  end

end
