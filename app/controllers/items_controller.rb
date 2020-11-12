class ItemsController < ApplicationController
  #before_action :set_item, only: [:edit, :update]
   before_action :authenticate_user!, only: [:new]

  def index   
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  # def show
  # end

  # def edit
  # end

  # def update
  #   @items.update(message_params)
  #   redirect_to root_path
  # end

  
  def create
    @item = Item.new(item_params)
   #バリデーションで問題があれば、保存はされず「投稿画面」に戻る
   if @item.valid?
     @item.save
     redirect_to root_path
   else
     #保存されなければ、newに戻る
     render 'new'
   end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
          end

     #def set_item
      # @items = Item.find(params[:id])
     #end
end
