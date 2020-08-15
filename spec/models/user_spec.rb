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
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと保存できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '@がないと保存できないこと' do
      @user.email = 'aomori12'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'emailが半角英数字でないと保存できないこと' do
      @user.email = 'ああ@イイ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空だと保存できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが６文字以上でないと保存できないこと' do
      @user.password = 'abcde'
      @user.password_confirmation = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'family_nameが空だと保存できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'family_nameが全角日本語でないと保存できないこと' do
      @user.family_name = 'abeﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid. Family name Full-width characters")
    end
    it 'first_nameが空だと保存できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameが全角日本語でないと保存できないこと' do
      @user.first_name = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end
    it 'familyname_readingが空だと保存できないこと' do
      @user.familyname_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Familyname reading can't be blank")
    end
    it 'familyname_readingが全角カタカナでないと保存できないこと' do
      @user.familyname_reading = 'あべ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Familyname reading  Full-width katakana characters')
    end
    it 'firstname_readingが空だと保存できないこと' do
      @user.firstname_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname reading can't be blank")
    end
    it 'firstname_readingが全角カタカナでないと保存できないこと' do
      @user.firstname_reading = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname reading  Full-width katakana characters")
    end
    it 'birthdayを選択していないと保存できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
