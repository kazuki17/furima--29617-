require 'rails_helper'

RSpec.describe BuyHistory, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @items = FactoryBot.build(:buy_history,  item_id: @item.id, user_id: @user.id)
    sleep 1
    end
 

  context '購入ができる時' do
     it '建物名が抜けていても登録できること' do
      @items.building = nil
      expect(@items).to be_valid
    end
  end
  
 context '商品購入ができない時' do
  it '商品名 postal_code  が空では保存できないこと' do
    @items.postal_code  = ''
    @items.valid?
    expect(@items.errors.full_messages).to include("Postal code can't be blank")
  end

  it '商品名 city が空では保存できないこと' do
    @items.city = ''
    @items.valid?
    expect(@items.errors.full_messages).to include("City can't be blank")
  end

  it '商品名 addresses が空では保存できないこと' do
    @items.addresses = ''
    @items.valid?
    expect(@items.errors.full_messages).to include("Addresses can't be blank")
  end

  it '商品名 phone_number が空では保存できないこと' do
    @items.phone_number = ''
    @items.valid?
    expect(@items.errors.full_messages).to include("Phone number can't be blank")
  end

  it '商品名 prefecture_id  が空では保存できないこと' do
    @items.prefecture_id  = ''
    @items.valid?
    expect(@items.errors.full_messages).to include("Prefecture is not a number")
  end



  it 'postal_codeはハイフンなしでは登録できないこと' do
    @items.postal_code  = '3333'
    @items.valid?
    expect(@items.errors.full_messages).to include("Postal code ハイフンを使い7桁〜１１桁の数字を入力してください")
  end

  it 'phone_numberは11桁以内でないと登録できないこと' do
    @items.postal_code  = '2222222222222'
    @items.valid?
    expect(@items.errors.full_messages).to include("Postal code ハイフンを使い7桁〜１１桁の数字を入力してください")
  end

  it 'prefecture_idで1が選択されている場合には購入ができない' do
    @items.prefecture_id = 1
    @items.valid?
    expect(@items.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it 'user_idが空では購入できないこと' do
    @items.user_id = ""
    @items.valid?
    expect(@items.errors.full_messages).to include("User can't be blank")
  end

  it 'item_idが空では購入できないこと' do
    @items.item_id = ""
    @items.valid?
    expect(@items.errors.full_messages).to include("Item can't be blank")
  end
 end 
 end
end