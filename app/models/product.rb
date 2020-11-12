class Product < ApplicationRecord
  def tax
    price * 0.09
  end

  def is_discounted?
    price < 10 #will return true or false
  end

  def total
    price + tax
    #price + (price * 0.09)
  end

end
