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
