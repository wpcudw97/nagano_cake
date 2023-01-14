class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

enum payment_method: { #支払方法
  credit_card: 0,
  transfer: 1
}

enum status: { #注文ステータス
  waiting_for_payment: 0,
  payment_confirmation: 1,
  production: 2,
  preparing_to_ship: 3,
  shipped: 4
}


end
