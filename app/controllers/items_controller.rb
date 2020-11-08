class ItemsController < ApplicationController
  # before_action :set_item, only: [:edit, :update]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all
    @items = Item.order('created_at DESC')
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
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :text)
          .end

    def set_item
      @items = Item.find(params[:id])
    end
  end
end
