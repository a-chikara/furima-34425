require 'rails_helper'

RSpec.describe PersonalDateRecord, type: :model do
  before do
    @personal_date_record = FactoryBot.build(:personal_date_record)
  end



  describe '商品購入機能' do
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
      it 'tokenが空では購入できない' do
        @personal_date_record.token = nil
        @personal_date_record.valid?
        expect(@personal_date_record.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end