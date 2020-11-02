require 'rails_helper'

RSpec.describe items, type: :model do
  describe '#create' do
    before do
      @items = FactoryBot.build(:item)
      @items.image = fixture_file_upload('public/images/test_image.png')
    end

    it 'contentとimageが存在していれば保存できること' do
      expect(@items).to be_valid
    end
    it 'imageが空では保存できないこと' do
      @items.image = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("Image can't be blank")
    end
    it 'contentが空では保存できないこと' do
      @items.content = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("Content can't be blank")
    end
  end
end