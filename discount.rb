module Discount
  attr_accessor :amount
  def apply_discount(total_amount, discount_amount)
    amount = total_amount - discount_amount
  end
end
