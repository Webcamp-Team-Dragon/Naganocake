class Public::ItemsController < ApplicationController
  # GET	/items
  def index
    # @items = Item.all
    @items = Item.page(params[:page]).per(8) # 1ページあたり5件
    @item = Item.page(params[:page])
    @total_items = Item.count
    @genres = Genre.all
  end

# GET	/items/:id
  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
end
