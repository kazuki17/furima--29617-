require 'rails_helper'

RSpec.describe BuyHistory, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @buy_history = FactoryBot.build(:buy_history,  item_id: @item.id, user_id: @user.id)
    sleep 1
    end
 

  context '購入ができる時' do
     it '建物名が抜けていても登録できること' do
      @buy_history.building = nil
      expect(@@buy_history).to be_valid
    end
  end
  
 context '商品購入ができない時' do
  it '商品名 postal_code  が空では保存できないこと' do
    @buy_history.postal_code  = ''
    @buy_history.valid?
    expect(@buy_history.errors.full_messages).to include("Postal code can't be blank")
  end

  it '商品名 city が空では保存できないこと' do
    @buy_history.city = ''
    @buy_history.valid?
    expect(@buy_history.errors.full_messages).to include("City can't be blank")
  end

  it '商品名 addresses が空では保存できないこと' do
    @buy_history.addresses = ''
    @buy_history.valid?
    expect(@buy_history.errors.full_messages).to include("Addresses can't be blank")
  end

  it '商品名 phone_number が空では保存できないこと' do
    @buy_history.phone_number = ''
    @buy_history.valid?
    expect(@buy_history.errors.full_messages).to include("Phone number can't be blank")
  end

  it '商品名 prefecture_id  が空では保存できないこと' do
    @buy_history.prefecture_id  = ''
    @buy_history.valid?
    expect(@buy_history.errors.full_messages).to include("Prefecture is not a number")
  end



  it 'postal_codeはハイフンなしでは登録できないこと' do
    @buy_history.postal_code  = '3333'
    @buy_history.valid?
    expect(@buy_history.errors.full_messages).to include("Postal code ハイフンを使い7桁〜１１桁の数字を入力してください")
  end

  it 'phone_numberは11桁以内でないと登録できないこと' do
    @buy_history.postal_code  = '2222222222222'
    @buy_history.valid?
    expect(@buy_history.errors.full_messages).to include("Postal code ハイフンを使い7桁〜１１桁の数字を入力してください")
  end

  it 'prefecture_idで1が選択されている場合には購入ができない' do
    @buy_history.prefecture_id = 1
    @buy_history.valid?
    expect(@buy_history.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it 'user_idが空では購入できないこと' do
    @buy_history.user_id = ""
    @buy_history.valid?
    expect(@buy_history.errors.full_messages).to include("User can't be blank")
  end

  it 'item_idが空では購入できないこと' do
    @buy_history.item_id = ""
    @buy_history.valid?
    expect(@buy_history.errors.full_messages).to include("Item can't be blank")
  end
 end 
 end
end