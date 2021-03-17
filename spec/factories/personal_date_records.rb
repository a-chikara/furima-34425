FactoryBot.define do
  factory :personal_date_record do
    postal_code                {'123-4567'}
    prefecture_id              {4}
    city                       {'東京'}
    address                    {'青山1-1'}
    phone_number               {'11111111111'}
    token                      {"tok_abcdefghijk00000000000000000"}
    building                   {'田中ビル'}
  end
end
