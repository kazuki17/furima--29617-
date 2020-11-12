require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @items = FactoryBot.build(:item)
    end

    context '商品出品ができる時' do
      it '全ての項目が入力されていれば出品できる' do
        expect(@items).to be_valid
      end
    end

    context '商品出品ができない時' do
      it '画像 image は1枚もないと保存できないこと' do
        @items.image = nil
        @items.valid?
        expect(@items.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名 name が空では保存できないこと' do
        @items.name = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明 text が空では保存できないこと' do
        @items.text = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーの情報 category_id が空では保存できないこと' do
        @items.category_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態についての情報 sales_status_id が空では保存できないこと' do
        @items.sales_status_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Sales status can't be blank")
      end
      it '配送料の負担についての情報 shipping_fee_status_id が空では保存できないこと' do
        @items.shipping_fee_status_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it '発送元の地域についての情報 prefecture_id が空では保存できないこと' do
        @items.prefecture_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include('Prefecture is not a number')
      end
      it '発送までの日数についての情報 scheduled_delivery_id が空では保存できないこと' do
        @items.scheduled_delivery_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include('Scheduled delivery is not a number')
      end
      it '価格についての情報 price が空では保存できないこと' do
        @items.price = ''
        @items.valid?
        expect(@items.errors.full_messages).to include('Price is out of setting range')
      end
      it 'カテゴリーの情報 category_id id:1が選択されている場合に出品ができない' do
        @items.category_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態についての情報 sales_status_id id:1が選択されている場合に出品ができない' do
        @items.sales_status_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Sales status must be other than 1')
      end
      it '配送料の負担についての情報 shipping_fee_status_id id:1が選択されている場合に出品ができない' do
        @items.shipping_fee_status_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Shipping fee status must be other than 1')
      end
      it '発送元の地域についての情報 prefecture_id id:1が選択されている場合に出品ができない' do
        @items.prefecture_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送までの日数についての情報 scheduled_delivery_id id:1が選択されている場合に出品ができない' do
        @items.scheduled_delivery_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Scheduled delivery must be other than 1')
      end
    end
  end
end
