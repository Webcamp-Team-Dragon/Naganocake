class Admin::ItemsController < ApplicationController
  # GET	/admin/items
  def index
   @items = Item.all
  end

# GET	/admin/items/new
  def new
   @item = Item.new
  end

# POST	/admin/items
  def create
   @item = Item.new(item_params)
    if @item.save
   flash[:notice] = ' 登録成功！'   
    redirect_to admin_item_path(@item.id)
    else
   flash[:notice] = ' 登録エラー！'
    render :new
    end
  end

# GET	/admin/items/:id
  def show
    @items = Item.find(params[:id])
  end

# GET	/admin/items/:id/edit
  def edit
    @items = Item.find(params[:id])
  end

# PATCH	/admin/items/:id
  def update
  @items = Item.find(params[:id])
   if @items.update(item_params)
    flash[:notice] = ' 更新成功！'    
    redirect_to admin_item_path(@items)
   else
    flash[:notice] = ' 更新エラー！'
    redirect_to admin_item_path(@items)
   end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :image, :is_active)
  end
end