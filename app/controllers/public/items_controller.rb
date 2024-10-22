class Public::ItemsController < ApplicationController
  # GET	/items
  def index
    if params[:genre_id] # ジャンルが選択された場合
      @genre = Genre.find(params[:genre_id]) #
      @search_items = @genre.items #
    else # 全商品の場合
      @search_items = Item.all
    end
    @total_items = @search_items.count
    @genres = Genre.all
    @items = @search_items.page(params[:page]).per(8)  # ページネーション対応
  end

# GET	/items/:id
  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
end
