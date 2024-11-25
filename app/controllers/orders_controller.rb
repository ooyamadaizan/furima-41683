class OrdersController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @order_address_form = OrderAddressForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address_form = OrderAddressForm.new(order_address_form_params)
    if @order_address_form.valid?
      pay_item
      @order_address_form.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_address_form_params
    params.require(:order_address_form).permit(:postal_code, :prefecture_id, :city, :address_line, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item[:price],
        card: order_address_form_params[:token],
        currency: 'jpy'
      )
  end
end