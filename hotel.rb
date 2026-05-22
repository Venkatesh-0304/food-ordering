# require_relative "food_item"
# require_relative "discount"
class Hotel
  include Discount
  attr_reader :name, :price, :quantity, :discount, :cart
  def initialize
    @cart = [] 
    @total_amount = 0
    @discount
  end

  def add_item_to_cart(name, price, quantity, category)
    if quantity <=0 
      raise ArgumentError, "Invalid quantity"
      #check return should be added here or not
    else
      if category.downcase == "veg"
        @cart << VegItem.new(name, price, quantity)
      elsif category.downcase == "nonveg"
        @cart << NonVegItem.new(name, price, quantity)
      else
        puts "Category not exist"
        return
      end
    end
  end

  def show_items_in_cart_based(category)
    @cart.select {|o| }  
  end

  def show_items_in_cart
    if @cart.empty?
      puts "Cart is empty"
      return
    end
    @cart.each do |o|
      price = o.quantity * o.price 
      puts "#{o.name} quantity #{o.quantity} price #{price}"
    end
  end

  def find_dish(name)
    @cart.find {|o| o.name.downcase == name}
  end

  def remove_item(name)
    order = find_dish(name)
    if order != nil
      puts "Removed item is #{name}"
      @cart.delete(order)
      calculate_amount
    else
      puts "#{name} not in orderlist"
      return
    end
  end



  def calculate_amount
    @cart.each do |o|
      price = o.quantity * o.price 
      @total_amount += price
    end
    puts @total_amount
  end

  def apply_discount(discount_amount)
    if @total_amount <= 0
      print "Price cannot be zero on discount"
      return
    end
    price = @total_amount - discount_amount
    @total_amount = price
    puts @total_amount
  end

  def show_veg_menu
    @cart.each do |o|
      puts o.class
    end
  end

  def show_veg_menu
    print "Available veg menu : \n"
    @cart.each do |o|
      if o.class.to_s == "VegItem"
        puts "#{o.name} veg"
      end
    end
  end

  def show_nonveg_menu
    print "Available non veg menu : \n"
    @cart.each do |o|
      if o.class.to_s == "NonVegItem"
        puts "#{o.name} nonveg"
      end
    end
  end

end

# o1 = Hotel.new()

# puts o1.add_item_to_cart("idli", 30, 3, "veg" )
# puts o1.add_item_to_cart("vada", 20, 2, "veg")
# puts o1.add_item_to_cart("chicken", 100, 2, "nonveg")
# o1.show_items_in_cart
# o1.show_veg_menu
# # puts o1.name
# # puts o1.price
# # puts o1.quantity
# puts "Discount amount is #{o1.discount}"
# # puts o1.cart.length
# o1.show_items_in_cart
# o1.apply_discount(10)
# # o1.remove_item("dose")
# # o1.remove_item("dose")
# # o1.remove_item("idli")
# # o1.show_items_in_cart
# # puts o1.cart.length
# puts o1.calculate_amount
# # puts o1.add_items_to_cart