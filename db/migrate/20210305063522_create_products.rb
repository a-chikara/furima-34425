class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string         :product_name
      t.text           :product_explain
      t.integer        :category_id
      t.integer        :product_status_id
      t.integer        :shipping_fee_id
      t.integer        :prefecture_id
      t.integer        :day_id
      t.integer        :price
      t.integer        :user_id, foreign_key: true
      t.timestamps
    end
  end
end
