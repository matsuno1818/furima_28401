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
      expect(@items.errors.full_messages).to include("画像を入力してください")
    end
    it '商品名が空では保存できないこと' do
      @items.name = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("名前を入力してください")
    end
    it '商品の説明が空では保存できないこと' do
      @items.text = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("テキストを入力してください")
    end
    it 'カテゴリーの選択をしないと保存できないこと' do
      @items.genre = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("カテゴリーを入力してください")
    end
    it '商品の状態について選択しないと保存できないこと' do
      @items.state = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("商品の状態を入力してください")
    end
    it '送料の負担について選択しないと保存できないこと' do
      @items.delivery = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("配送料の負担を入力してください")
    end
    it '配送元の地域を選択しないと保存できないこと' do
      @items.prefecture = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("都道府県を入力してください")
    end
    it '発送までの日数を選択しないと保存できないこと' do
      @items.shipment = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("配送までの日数を入力してください")
    end
    it '価格が空では保存できないこと' do
      @items.price = nil
      @items.valid?
      expect(@items.errors.full_messages).to include("価格を入力してください")
    end
    it '価格が¥300未満では保存できないこと' do
      @items.price = 299
      @items.valid?
      expect(@items.errors.full_messages).to include("価格の範囲外です")
    end
    it '価格が¥9,999,999を超過すると保存できないこと' do
      @items.price = 10000000
      @items.valid?
      expect(@items.errors.full_messages).to include("価格は9999999以下の値にしてください")
    end
 end
end
