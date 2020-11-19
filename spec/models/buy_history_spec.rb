require 'rails_helper'

RSpec.describe BuyHistory, type: :model do
  describe '#create' do
    before do
      @items = FactoryBot.build(:buy_history)
    end
  end  

  context '購入ができる時' do
    it '全ての項目が入力されていれば購入できる' do
      expect(@items).to be_valid
    end
  end
  it '商品名 postal_code  が空では保存できないこと' do
    @items.postal_code  = ''
    @items.valid?
    expect(@items.errors.full_messages).to include("Name can't be blank")
  end
  it '商品名 city が空では保存できないこと' do
    @items.city = ''
    @items.valid?
    expect(@items.errors.full_messages).to include("Name can't be blank")
  end

  it '商品名 addresses が空では保存できないこと' do
    @item.addresses = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end

  it '商品名 building が空では保存できないこと' do
    @items.building = ''
    @items.valid?
    expect(@items.errors.full_messages).to include("Name can't be blank")
  end

  it '商品名 phone_number が空では保存できないこと' do
    @items.phone_number = ''
    @items.valid?
    expect(@items.errors.full_messages).to include("Name can't be blank")
  end
  it '商品名 user_id が空では保存できないこと' do
    @items.user_id = ''
    @items.valid?
    expect(@items.errors.full_messages).to include("Name can't be blank")
  end
  it '商品名 item_id が空では保存できないこと' do
    @items.item_id = ''
    @items.valid?
    expect(@items.errors.full_messages).to include("Name can't be blank")
  end
end