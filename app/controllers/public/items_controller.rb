class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @total_items = Item.count
    @genres = Genre.all
  end

  def show
  end
end
