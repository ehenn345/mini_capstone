class Product < ApplicationRecord
  def tax
   p "i am a tax"
   price * 1.09
  end
end
