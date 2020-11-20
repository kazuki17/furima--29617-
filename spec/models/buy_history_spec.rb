require 'rails_helper'

RSpec.describe BuyHistory, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.create(:item)
      @items = FactoryBot.build(:buy_history,  item_id: @item.id)
      sleep 1
    end
 

  context '購入ができる時' do
     it '全ての項目が入力されていれば購入できる' do
       expect(@items).to be_valid
     end
   end

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

  it '建物名が抜けていても登録できること' do
    @items.building  = ''
    expect(@items).to be_valid
  end

  it 'postal_codeはハイフンなしでは登録できないこと' do
    @items.postal_code  = '-'
    @items.valid?
    expect(@items.errors.full_messages).to include("Postal code ハイフンを使い7桁〜１１桁の数字を入力してください")
  end

  it 'phone_numberは11桁以内でないと登録できないこと' do
    @items.postal_code  = '2222222222222'
    @items.valid?
    expect(@items.errors.full_messages).to include("Postal code ハイフンを使い7桁〜１１桁の数字を入力してください")
  end

  it 'prefecture_idが選択されている場合に出品ができない' do
    @items.prefecture_id = 1
    @items.valid?
    expect(@items.errors.full_messages).to include("Prefecture must be other than 1")
  end
 end 
end