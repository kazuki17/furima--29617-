class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]
 
 
  def index
  @items = Item.all
 end
 
 def new
  @items = Item.all
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
 end

 private
 def item_params
  params.require(:items).permit(:content, :image)
 end

 def set_item
  @items = Item.find(params[:id])
end

end
