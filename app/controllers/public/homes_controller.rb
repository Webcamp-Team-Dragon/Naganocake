class Public::HomesController < ApplicationController
  # GET	/
  def top
    @genres = Genre.all
    @items = Item.where(is_active: true).order(created_at: :desc).limit(4)
  end

# GET	/about
  def about
  end
end
