class Public::CartItemsController < ApplicationController
  # GET	/cart_items
  def index
  end

# PATCH	/cart_items/:id
  def update
  end

# DELETE	/cart_items/:id
  def destroy
  end

# DELETE	/cart_items/destroy_all
  def destroy_all
  end

# POST	/cart_items
  def create
    if customer_signed_in?
      @cart_item = CartItem.new(items_id: params[:item_id], amount: params[:quantity])
      if @cart_item.save
        redirect_to public_cart_items_path, notice: '商品がカートに追加されました'
      else
        redirect_to public_item_path(params[:item_id]), alert: '商品をカートに追加できませんでした'
      end
    else
      flash[:alert] = "ログインしてください。"
      redirect_to public_item_path(params[:item_id])
    end
  end

end