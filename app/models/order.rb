class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

#   # def subtotal
#   #   price
#   # end

#   def tax
#     price * 0.09
#   end

#   def total
#     price + tax
#   end


end
