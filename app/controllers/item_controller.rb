class ItemController < ApplicationController
  def show
    @item = Item.find(params[:id])
		@customer = Customer.find(@item.customer_id)
  end

end
