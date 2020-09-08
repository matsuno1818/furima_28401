require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録情報の保存' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと保存できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it 'nicknameが重複していると保存できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, nickname: @user.nickname)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("ニックネームはすでに存在します")
    end
    it 'emailが空だと保存できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it 'emailが重複していると保存できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
     expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end
    it '@がないと保存できないこと' do
      @user.email = 'aomori12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end
    it 'passwordが空だと保存できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'passwordが６文字以上でないと保存できないこと' do
      @user.password = 'abcde'
      @user.password_confirmation = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'family_nameが空だと保存できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を入力してください")
    end
    it 'family_nameが全角日本語でないと保存できないこと' do
      @user.family_name = 'abeﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include("名字は全角で入力してください")
    end
    it 'first_nameが空だと保存できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end
    it 'first_nameが全角日本語でないと保存できないこと' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は全角で入力してください")
    end
    it 'familyname_readingが空だと保存できないこと' do
      @user.familyname_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ミョウジを入力してください")
    end
    it 'familyname_readingが全角カタカナでないと保存できないこと' do
      @user.familyname_reading = 'あべ'
      @user.valid?
      expect(@user.errors.full_messages).to include('ミョウジは全角カナで入力してください')
    end
    it 'firstname_readingが空だと保存できないこと' do
      @user.firstname_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ナマエを入力してください")
    end
    it 'firstname_readingが全角カタカナでないと保存できないこと' do
      @user.firstname_reading = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("ナマエは全角カナで入力してください")
    end
    it 'birthdayを選択していないと保存できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
  end
end
