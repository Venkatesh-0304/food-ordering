class FoodItem
  attr_reader :name, :price, :quantity
  def initialize(name, price, quantity)
    @name = name
    @price = price
    @quantity = quantity
  end
end

class VegItem < FoodItem
end

class NonVegItem < FoodItem
end

# dose = VegItem.new("dose", 100, 3)

# chicken = NonVegItem.new("chicken", 150, 2)

# # # dish1 = VegItem.new(dose)

# # puts dose.kind_of?(VegItem)
# # puts chicken.kind_of?(NonVegItem)

# # puts dose.price
# # puts dose.class
