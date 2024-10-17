class Public::ItemsController < ApplicationController
  # GET	/items
  def index
    @items = Item.all
    @total_items = Item.count
    @genres = Genre.all
  end

# GET	/items/:id
  def show
    @item = Item.find(params[:id])
  end
end
