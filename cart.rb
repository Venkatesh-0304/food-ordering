class Cart
  include Discount
  attr_reader :name, :price, :quantity, :cart
  def initialize
    @cart = [] 
  end

  def add_item_to_cart(name, price, quantity, category)
    if quantity <=0 
      raise InvalidQuantity, "Invalid quantity"
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
    else
      puts "#{name} not in orderlist"
      return
    end
  end

  def calculate_total_amount(discount = 0)
    if discount > 0 && discount != nil
      return calculate_amount(discount)
    end
    calculate_amount
  end

  private
  def calculate_amount(discount = 0)
    total_amount = 0
    @cart.each do |o|
      price = o.quantity * o.price 
      total_amount += price
    end
    if discount > 0
      total_amount = apply_discount(total_amount, discount)
    end
      total_amount
  end
end