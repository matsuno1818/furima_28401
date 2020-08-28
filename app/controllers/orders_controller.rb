class OrdersController < ApplicationController

before_action :item_params, only: [:create]


  def index
    @item = Item.find(params[:item_id])
    @order = ItemOrder.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    if @item.order != nil
      redirect_to root_path
    end
  end

  def new
    @order = ItmeOrder.new
  end

  def create
    @order = ItemOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save  
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render "index"    
    end
  end
  
  private

  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def item_params
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],  
      currency:'jpy' 
      )
  end

end
