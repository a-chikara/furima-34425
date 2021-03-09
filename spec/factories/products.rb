FactoryBot.define do
  factory :product do
    product_name                     {'テスト'}
    product_explain                  {'商品の説明'}
    category_id                         {3}
    product_status_id                   {3}
    shipping_fee_id                     {3}
    prefecture_id                       {2}
    day_id                              {2}
    price                            {'500'}
    

    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/publicdomainq-0027789zgb.jpg'), filename: 'publicdomainq-0027789zgb.jpg')
    end
  end
end
