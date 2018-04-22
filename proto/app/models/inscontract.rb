class Inscontract < ApplicationRecord
  validates :member_id, presence: true
  validates :inception_datetime_at, presence: true
  validates :expiry_datetime_at, presence: true
  validates  :product_id, presence: true

  belongs_to :member
  belongs_to :product

end
