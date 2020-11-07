require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
   @items = FactoryBot.build(:item)
  end

  describe "アイテムの登録" do
    it 'nameが空だと登録できない' do
      @items.name = ""
      @items.valid?
      expect(@items.errors.full_messages).to include("Image can't be blank")
    end
    it 'textが空では保存できないこと' do
      @items.text = ""
      @items.valid?
      expect(@items.errors.full_messages).to include("Image can't be blank")
    end
    it 'item_category_idが空では保存できないこと' do
      @items.item_category_id = ""
      @items.valid?
      expect(@items.errors.full_messages).to include("Image can't be blank")
    end
    it 'item_sales_status_idが空では保存できないこと' do
      @items.item_sales_status_id = ""
      @items.valid?
      expect(@items.errors.full_messages).to include("Image can't be blank")
    end
    it 'item_shipping_fee_status_idが空では保存できないこと' do
      @items.item_shipping_fee_status_id = ""
      @items.valid?
      expect(@items.errors.full_messages).to include("Image can't be blank")
    end
    it 'item_prefecture_idが空では保存できないこと' do
      @items.item_prefecture_id = ""
      @items.valid?
      expect(@items.errors.full_messages).to include("Image can't be blank")
    end
    it 'item_scheduled_delivery_idが空では保存できないこと' do
      @items.item_scheduled_delivery_id = ""
      @items.valid?
      expect(@items.errors.full_messages).to include("Image can't be blank")
    end
  end
end