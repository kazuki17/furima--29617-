class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :edit, :show]
  # before_action :move_to_index, except: [:index, :show, :edit]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
     if  current_user.id != @item.user.id
      redirect_to root_path
     end
  end

   def update
    if @item.update(item_params)
       redirect_to item_path
    else
      render :new
    end
   end

  def create
    @item = Item.new(item_params)
    # バリデーションで問題があれば、保存はされず「投稿画面」に戻る
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      # 保存されなければ、newに戻る
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index, 
  #   end
  # end
end
