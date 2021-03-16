class PersonalDateRecord

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :phone_number, :building, :user_id, :product_id, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :token

  end


  
  def save
    # 各テーブルにデータを保存する処理を書く
    record = Record.create(user_id: user_id, product_id: product_id)
    PersonalDate.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, building: building, record_id: record.id)
  end
end