require 'rails_helper'

RSpec.describe UserDonation, type: :model do
  describe '新規登録情報の保存' do
    before do
      @user = FactoryBot.build(:user)
    end

    