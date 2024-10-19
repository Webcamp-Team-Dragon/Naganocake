class Public::CartItemsController < ApplicationController

  # GET	/cart_items
  def index
    @cart_items = current_customer.cart_items.includes(:item) # 現在の顧客のカートアイテムを取得
  end

# PATCH	/cart_items/:id
  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(amount: params[:amount]) # 数量を更新
      redirect_to public_cart_items_path, notice: '数量が更新されました'
    else
      redirect_to public_cart_items_path, alert: '数量の更新に失敗しました'
    end
  end

# DELETE	/cart_items/:id
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path, notice: '商品がカートから削除されました' # カートの一覧ページにリダイレクト
  end

# DELETE	/cart_items/destroy_all
  def destroy_all
    current_customer.cart_items.destroy_all # 現在の顧客のカートアイテムをすべて削除
    redirect_to public_cart_items_path, notice: 'カートが空になりました'
  end

# POST	/cart_items
  def create
    if customer_signed_in?
      quantity = params[:quantity].to_i  # フォームから送信されたquantityは文字列として受け取られます。to_iを使って整数に変換します。
      logger.debug "Quantity: #{quantity}, Item ID: #{params[:item_id]}"
      if quantity > 0  # フォームで選択された数量が0より大きいかをチェックしています。
        @cart_item = CartItem.new(item_id: params[:item_id], amount: quantity, customer_id: current_customer.id)
        if @cart_item.save
          redirect_to public_cart_items_path, notice: '商品がカートに追加されました'
        else
          # logger.debug @cart_item.errors.full_messages  エラーメッセージをログに出力
          redirect_to public_item_path(params[:item_id]), alert: '商品をカートに追加できませんでした'
        end
      else
        redirect_to public_item_path(params[:item_id]), alert: '個数を選択してください'
      end
    else
      flash[:alert] = "ログインしてください。"
      redirect_to public_item_path(params[:item_id])
    end
  end
end