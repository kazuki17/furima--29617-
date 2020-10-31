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
 end

end
