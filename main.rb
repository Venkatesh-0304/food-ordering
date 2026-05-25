require_relative "food_item"
require_relative "discount"
require_relative "cart"

cart1 = Cart.new()

cart1.add_item_to_cart("idli", 100, 2, "veg")
cart1.add_item_to_cart("dose", 200, 3, "veg")
cart1.add_item_to_cart("chicken", 250, 2, "nonveg")
cart1.show_items_in_cart
puts "The total amount is #{cart1.calculate_total_amount}"
puts "Total amount after discount #{cart1.calculate_total_amount(300)}"



