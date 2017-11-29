class Order < ApplicationRecord
  # set up associations
  belongs_to :order_status
  belongs_to :user
  has_many :order_items

  # set up callbacks
  before_validation :set_order_status
  before_validation :set_user
  before_save :update_subtotal

  def update_subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

private
  def set_order_status
    self.order_status_id = 1
  end

  def set_user
    self.user_id = User.current_user
  end
  def update_subtotal
    self[:subtotal] = subtotal
  end
end