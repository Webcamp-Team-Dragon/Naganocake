class Public::HomesController < ApplicationController
  # GET	/
  def top
    @items = Item.where(is_active: true).order(created_at: :desc).limit(4)
  end

# GET	/about
  def about
  end
end
