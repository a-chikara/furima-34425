require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailが一意性でなければ登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに@がないと登録できない" do
      @user.email = 'testtest'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが6文字未満では登録できない" do
      @user.password = '00000' &&  @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)") 
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordは半角英数字混合での入力でなければ登録できない" do
      @user.password = '００００００' && @user.password_confirmation = '００００００'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
    end
    it "passwordは確認用を含めて2回入力すること" do
      @user.password = '000000' 
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordとpassword_confirmationの値の一致していなければ登録できない" do
      @user.password = '000000'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_nameが空では登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "last_nameが全角でなければ登録できない" do
      @user.last_name = 'tanaka'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "first_nameが全角でなければ登録できない" do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end
    it "last_name_katakanaが空では登録できない" do
      @user.last_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name katakana can't be blank")    
    end
    it "last_name_katakanaがカタカナでなければ登録できない" do
      @user.last_name_katakana = 'たなか'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name katakana is invalid. Input full-width katakana characters.")
    end
    it "first_name_katakanaが空では登録できない" do
      @user.first_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana can't be blank")
    end
    it "first_name_katakanaがカタカナでなければ登録できない" do
      @user.first_name_katakana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana is invalid. Input full-width katakana characters.")
    end
    it 'birthdayが選択されていなければ登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
