require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'last_nameが空では保存できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid. Input full-width characters.')
    end
    it 'first_nameが空では保存できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_kanaが空では保存できないこと' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが空では保存できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'encrypted_passwordが空では保存できないこと' do
      @user.encrypted_password = ''
      @user.valid?
      expect(@user.errors.full_messages)
    end
    it 'すべての情報が正しいフォーマットで入力されていればユーザー登録できる' do
      expect(@user).to be_valid
    end
    it 'birth_dateの情報が空だとユーザー登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
    it 'emailが登録済みであるとユーザー登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages)
    end
    it 'emailに@が含まれていないとユーザー登録できない' do
      @user.email = 'poifes'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下だとユーザー登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      expect(@user).to be_valid
    end
    it 'passwordが空の場合だと保存できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが半角英数字のみユーザー登録できる' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが数字のみの場合ユーザー登録できない' do
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordとpassword_confirmation（確認用）が一致しないとユーザー登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない' do
      @user.last_name = 'poifes'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters.')
    end
    it 'first_nameが全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない' do
      @user.first_name = 'poifes'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
    end
    it 'last_name_kanaのフリガナが全角（カタカナ）以外だとユーザー登録できない' do
      @user.last_name_kana = 'poifes'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters.')
    end
    it 'first_name_kanaのフリガナが全角（カタカナ）以外だとユーザー登録できない' do
      @user.first_name_kana = 'poifes'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters.')
    end
  end
end
