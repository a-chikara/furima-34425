require 'rails_helper'

RSpec.describe PersonalDateRecord, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    @personal_date_record = FactoryBot.build(:personal_date_record, user_id: @user.id, product_id: @product.id)
    sleep 0.1 # 0.1秒待機
  end



  describe '商品購入機能' do
    context '購入できる場合' do
      it '必須項目が記入されていれば購入できる' do
        expect(@personal_date_record).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @personal_date_record.building = ''
        expect(@personal_date_record).to be_valid
      end
    end


    context '購入できない場合' do
      it 'postal_codeが空では購入できない' do
        @personal_date_record.postal_code = ''
        @personal_date_record.valid?
        expect(@personal_date_record.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeの保存にはハイフンが必須である' do
        @personal_date_record.postal_code = '1111111'
        @personal_date_record.valid?
        expect(@personal_date_record.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが空では購入できない' do
        @personal_date_record.prefecture_id = ''
        @personal_date_record.valid?
        expect(@personal_date_record.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが0では購入できない' do
        @personal_date_record.prefecture_id = '0'
        @personal_date_record.valid?
        expect(@personal_date_record.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @personal_date_record.city = ''
        @personal_date_record.valid?
        expect(@personal_date_record.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できない' do
        @personal_date_record.address = ''
        @personal_date_record.valid?
        expect(@personal_date_record.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @personal_date_record.phone_number = ''
        @personal_date_record.valid?
        expect(@personal_date_record.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは11桁以内の数値のみ保存可能' do
        @personal_date_record.phone_number = '111111111111'
        @personal_date_record.valid?
        expect(@personal_date_record.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが英数混合ならば購入できない' do
        @personal_date_record.phone_number = 'aaaa111111'
        @personal_date_record.valid?
        expect(@personal_date_record.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では購入できない' do
        @personal_date_record.token = nil
        @personal_date_record.valid?
        expect(@personal_date_record.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では購入できない' do
        @personal_date_record.user_id = ''
        @personal_date_record.valid?
        expect(@personal_date_record.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが空では購入できない' do
        @personal_date_record.product_id = ''
        @personal_date_record.valid?
        expect(@personal_date_record.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end