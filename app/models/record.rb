class Record < ApplicationRecord
  has_one :personal_date
  belongs_to :user
  belongs_to :product


end
