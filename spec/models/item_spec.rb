require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '商品出品情報の保存' do
    before do
      @items = FactoryBot.build(:item)
      @items.image = fixture_file_upload('public/images/test_image.png')
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@items).to be_valid
    end
    it '画像が空では保存できないこと' do
      @items.image = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空では保存できないこと' do
      @items.name = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が空では保存できないこと' do
      @items.text = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("Text can't be blank")
    end
    it 'カテゴリーの選択をしないと保存できないこと' do
      @items.genre = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("Genre can't be blank")
    end
    it '商品の状態について選択しないと保存できないこと' do
      @items.state = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("State can't be blank")
    end
    it '送料の負担について選択しないと保存できないこと' do
      @items.delivery = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("Delivery can't be blank")
    end
    it '配送元の地域を選択しないと保存できないこと' do
      @items.prefecture = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '発送までの日数を選択しないと保存できないこと' do
      @items.shipment = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("Shipment can't be blank")
    end
    it '価格が空では保存できないこと' do
      @items.price = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が¥300未満では保存できないこと' do
      @items.price = 299
      @items.valid?
      expect(@items.errors.full_messages).to include("Price Price Out of setting range")
    end
    it '価格が¥9,999,999を超過すると保存できないこと' do
      @items.price = 10000000
      @items.valid?
      expect(@items.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
 end
end
