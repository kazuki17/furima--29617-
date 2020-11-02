class ItemsController < ApplicationController

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

 def create
  Item.create(item_params)
 end

 private
 def item_params
  params.require(:items).permit(:content, :image)
 end

end
