class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :order_status
  has_many :order_items
  before_create :set_order_status


  def total
  	order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0}.sum * 100
  end

private
  def set_order_status
  	self.order_status_id = 1
  end
end
