class OrderDetail < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :item, optional: true

  enum making_status: { #製作ステータス
  can_not_production: 0,
  waiting_for_production: 1,
  production: 2,
  completion_of_production: 3
}

def subtotal
  item.with_tax_price * amount
end


end