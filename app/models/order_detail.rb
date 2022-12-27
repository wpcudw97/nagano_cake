class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: {
  can_not_production: 0,
  waiting_for_production: 1,
  production: 2,
  completion_of_production: 3
}
end
