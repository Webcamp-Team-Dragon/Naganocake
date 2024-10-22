class Public::ItemsController < ApplicationController
  # GET	/items
  def index
    @items = @search.result.page(params[:page]).per(8)
    @total_items = Item.count
    @genres = Genre.all
  end

# GET	/items/:id
  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
end
