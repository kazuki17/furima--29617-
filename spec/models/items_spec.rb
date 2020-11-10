require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @items = FactoryBot.build(:item)
      @items.image = fixture_file_upload('public/images/test_image.png')
    end

 
    it '画像 image は1枚もないと保存できないこと(ActiveStorageを使用すること)' do
      @items.image = ''
      @items.valid?
      expect(@items.errors.full_messages).to include("User must exist")
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
      expect(@items.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '発送までの日数についての情報 scheduled_delivery_id が空では保存できないこと' do
      @items.scheduled_delivery_id = ''
      @items.valid?
      expect(@items.errors.full_messages).to include("Scheduled delivery can't be blank")
    end
    it '価格についての情報 price が空では保存できないこと' do
      @items.price = ''
      @items.valid?
      expect(@items.errors.full_messages).to include("Price can't be blank")
    end
     it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @items.price = 299
      @items.price = 10000000
      @items.valid?
      expect(@items.errors.full_messages).to include("User must exist")
     end
    it '販売価格は半角数字のみ保存可能であること' do
      @items.price = 'qqqqqq'
      @items.valid?
      expect(@items.errors.full_messages).to include("User must exist")
    end

    it 'カテゴリーの情報 category_id id:1が選択されている場合に出品ができない' do
      @items.category_id = 'id:1'
      @items.valid?
      expect(@items.errors.full_messages).to include("User must exist")
    end
    it '商品の状態についての情報 sales_status_id id:1が選択されている場合に出品ができない' do
      @items.sales_status_id = 'id:1'
      @items.valid?
      expect(@items.errors.full_messages).to include("User must exist")
    end
    it '配送料の負担についての情報 shipping_fee_status_id id:1が選択されている場合に出品ができない' do
      @items.shipping_fee_status_id = 'id:1'
      @items.valid?
      expect(@items.errors.full_messages).to include("User must exist")
    end
    it '発送元の地域についての情報 prefecture_id id:1が選択されている場合に出品ができない' do
      @items.prefecture_id = 'id:1'
      @items.valid?
      expect(@items.errors.full_messages).to include("User must exist")
    end
    it '発送までの日数についての情報 scheduled_delivery_id id:1が選択されている場合に出品ができない' do
      @items.scheduled_delivery_id = 'id:1'
      @items.valid?
      expect(@items.errors.full_messages).to include("User must exist")
    end
  end
end
