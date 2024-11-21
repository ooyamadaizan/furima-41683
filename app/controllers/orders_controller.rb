class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address_form = OrderAddressForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address_form = OrderAddressForm.new(order_address_form_params)
    binding.pry
    if @order_address_form.valid?
      @order_address_form.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_address_form_params
    params.require(:order_address_form).permit(:postal_code, :prefecture_id, :city, :address_line, :building_name, :phone_number, ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end