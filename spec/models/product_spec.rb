require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it '全て入力できていれば出品できる' do
        expect(@product).to be_valid
      end
    end
    context '出品できない場合' do
      it 'product_nameが空では出品できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end
      it 'product_explainが空では出品できない' do
        @product.product_explain = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product explain can't be blank")
      end
      it 'category_idが空では出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが1では保存できない' do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      it 'product_status_idが空では出品できない' do
        @product.product_status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product status can't be blank")
      end
      it 'product_status_idが1では出品できない' do
        @product.product_status_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Product status must be other than 1")
      end
      it 'shipping_fee_idが空では出品できない' do
        @product.shipping_fee_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'shipping_fee_idが1では出品できない' do
        @product.shipping_fee_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee must be other than 1")
      end
      it 'prefecture_idが空では出品できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1では出品できない' do
        @product.prefecture_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'day_idが空では出品できない' do
        @product.day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Day can't be blank")
      end
      it 'day_idが1では出品できない' do
        @product.day_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Day must be other than 1")
      end
      it 'priceが空では出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは300円以上でなければ出品できない' do
        @product.price = '100'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than 299")
      end
      it 'priceは10000000円以上でなければ出品できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than 10000000")
      end
      it 'priceは半角数字でなければ保存できない' do
        @product.price = '５００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it 'priceは半角英数混合では登録できない' do
        @product.price = '3adege'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it 'priceは半角英語だけでは登録できないこと' do
        @product.price = 'aaaaa'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it 'imageは必ず一枚以上つけなければ出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
