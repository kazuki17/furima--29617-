class OrdersController < ApplicationController
   before_action :authenticate_user!, only: [:index]
   before_action :set_item, only:[:index, :create]  

    def index
      @buy = BuyHistory.new   

      if current_user.id == @item.user_id || @item.purchase_history != nil
        redirect_to root_path
      end

    end

    # def new
    #   @item = BuyHistory.new
    # end

    def create
      @buy = BuyHistory.new(item_params)
      if @buy.valid?
         pay_item
         @buy.save
         redirect_to root_path
      else
        render action: :index
      end

    end

    private

    def item_params
      params.permit(:prefecture_id,:item_id, :postal_code, :city, :addresses, :building, :phone_number, :token).merge(user_id: current_user.id)
    end

   def pay_item
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
     Payjp::Charge.create(
       amount: @item.price,  # 商品の値段
       card:   item_params[:token],    # カードトークン
       currency: 'jpy'                 # 通貨の種類（日本円）
     )
   end

   def set_item
    @item = Item.find(params[:id])
  end

end
