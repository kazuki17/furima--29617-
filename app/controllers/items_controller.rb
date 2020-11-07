class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]
 
  def index
  @items = Item.all
  @items = Item.order("created_at DESC")
  end
 
 def new
  @items = Item.new
 end

 def show
 end

 def edit
 end

 def update
  @items.update(message_params)
  redirect_to root_path
 end

 def create
  @items = Item.new(item_params)
  if @items.save
    redirect_to root_path
  else
    @items = items.includes(:user)
    render :index
  end
 end

 private
 def item_params
  params.require(:item).permit(:image, :name, :text, :item_category_id, :item_sales_status_id, :item_shipping_fee_status_id, :item_prefecture_id, :item_scheduled_delivery_id).merge(user_id: current_user.id)
 end

 def set_item
  @items = Item.find(params[:id])
 end

end
