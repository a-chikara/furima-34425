class Product < ApplicationRecord
  belongs_to :user
  # has_one :record
  has_one_attached :image


  with_options presence: true do
    validates :product_name
    validates :product_explain
    with_options numericality: { other_than: 1 } do
      validates :category_id 
      validates :product_status_id
      validates :shipping_fee_id
      validates :prefecture_id
      validates :day_id
    end
    validates :price, numericality: { greater_than:299 , less_than: 10000000},format:{with: /\A[0-9]+\z/}
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :day
    belongs_to :prefecture
    belongs_to :product_status
    belongs_to :shipping_fee
  end
