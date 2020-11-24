class Product < ApplicationRecord

  validates :name, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :description, length: { in: 5..500}
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

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
