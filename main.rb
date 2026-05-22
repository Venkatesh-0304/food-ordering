require_relative "food_item"
require_relative "discount"
require_relative "hotel"

h1 = Hotel.new()
loop do 
  puts "choose the option :"
  puts "1. Add item"
  puts "2. Remove item"
  puts "3. Calculate total amount"
  puts "4. Apply discounts"
  puts "5. Veg menu"
  puts "6. NonVeg menu"
  puts "7. Exit"
  
  choice = gets.chomp.to_i

  case choice

   #add item to cart 
  when 1
    print "Enter the dish : "; name = gets.chomp
    print "Enter the price : "; price = gets.chomp.to_i
    print "Enter the quantity : ";quantity = gets.chomp.to_i
    print "Enter the category (Veg/NonVeg) : "; category = gets.chomp 
    h1.add_item_to_cart(name, price, quantity, category)
  
  #remove item
  when 2
    print "Enter the item to remove "; name = gets.chomp
    h1.remove_item(name)
    print "Cart list after item removed : \n"
    h1.show_items_in_cart
  
  #calculate total
  when 3 
    h1.calculate_amount

  #apply discount
  when 4
    print "Enter the amount to be discounted : "; discount_amount = gets.chomp.to_i
    h1.apply_discount(discount_amount)

  when 5
    h1.show_veg_menu

  when 6
    h1.show_nonveg_menu

  #exit
  when 7
    print "Bye"
    break
  end


end