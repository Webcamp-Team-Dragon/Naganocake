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
    redirect_to cart_path, notice: '商品がカートに追加されました'
  end
end
