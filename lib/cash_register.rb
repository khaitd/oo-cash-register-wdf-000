require 'pry'
class CashRegister

  attr_accessor :total, :discount, :items


   @items = []
   @price = []
  def self.itemz
    @items
  end

  def self.price
    @price
  end

  def initialize(discount = 0)
     self.class.itemz.clear
     self.class.price.clear
     @total = 0
     @discount = discount
  end

  def add_item(item, price, quantity = 1)

      quantity.times do
        self.class.itemz << item
     end

     self.class.price  << price*quantity
     @total += price*quantity
  end

  def apply_discount
    if @discount > 0
      self.total = (self.total* ((100.0-self.discount)/100.0)).to_i
      "After the discount, the total comes to $#{self.total}."
    else
        "There is no discount to apply."
    end
  end

  def items
    self.class.itemz
  end

  def void_last_transaction

    @total -= self.class.price.last

  end


end
