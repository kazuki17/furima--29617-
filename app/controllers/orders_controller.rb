class OrdersController < ApplicationController
    
    def index
      @item = Item.find(params[:item_id])
      @buy = BuyHistory.new   
    end

    # def new
    #   @item = BuyHistory.new
    # end

    def create
      @item = Item.find(params[:item_id])
      @buy = BuyHistory.new(item_params)   
      # binding.pry
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
     Payjp.api_key = "sk_test_da95491309b89422c364872a"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
     Payjp::Charge.create(
       amount: @item.price,  # 商品の値段
       card:   item_params[:token],    # カードトークン
       currency: 'jpy'                 # 通貨の種類（日本円）
     )
   end
end
