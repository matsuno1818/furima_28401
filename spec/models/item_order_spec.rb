require 'rails_helper'
RSpec.describe ItemOrder, type: :model do
  describe '住所情報' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item)
      item.image = fixture_file_upload('public/images/test_image.png')
      item.save
      sleep(0.5)
      @item_order = FactoryBot.build(:item_order, user_id: user.id, item_id: item.id)
    end
    
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item_order).to be_valid
    end
    it 'カード情報が空では登録できないこと' do
      @item_order.token = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Tokenを入力してください")
    end
    it '郵便番号が空では登録できないこと' do
      @item_order.postal_code = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("郵便番号を入力してください")
    end
    it '郵便番号にはハイフン(-)がないと登録できないこと' do
      @item_order.postal_code = '1234567'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("郵便番号にハイフンを入れて入力してくださ")
    end
    it '都道府県が空では登録できないこと' do
      @item_order.prefecture_id = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("都道府県を入力してください")
    end
    it '市区町村が空では登録できなこと' do
      @item_order.city = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("市区町村を入力してください")
    end
    it '番地が空では登録できないこと' do
      @item_order.house_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("番地を入力してください")
    end
    it '電話番号が空では登録できないこと' do
      @item_order.phone_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("電話番号を入力してください")
    end
    it '電話番号は11文字以内でないと保存できないこと' do
      @item_order.phone_number = "080123456789"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("電話番号は11桁で入力してください")
    end
  end
end