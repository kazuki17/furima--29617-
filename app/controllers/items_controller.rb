class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]
 
  def index
  @items = Item.all
  @items = Item.order("created_at DESC")
 end
 
 def new
  @items = Item.all
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
  Item.create(item_params)
  @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
 end

 private
 def item_params
  params.require(:items).permit(
    :title,
    :text,
    :genre_id
  )
 end

 def set_item
  @items = Item.find(params[:id])
 end

end
