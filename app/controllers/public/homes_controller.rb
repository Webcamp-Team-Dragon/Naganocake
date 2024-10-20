class Public::HomesController < ApplicationController
  # GET	/
  def top
　Item.where(is_active: true).order(created_at: "DESC").limit(4)
  end

# GET	/about
  def about
  end
end
