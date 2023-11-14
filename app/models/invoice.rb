class Invoice < ApplicationRecord
  validates_presence_of :status,
                        :customer_id

  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items

  enum status: [:cancelled, :in_progress, :completed]

  def total_revenue
    invoice_items.sum("unit_price * quantity")
  end

  def discounts_for_specific_invoice
    Invoice
    .select("quantity, unit_price, best_discount")
    .from(invoice_items
      .joins(:bulk_discounts)
      .select("invoice_items.id, invoice_items.quantity, invoice_items.unit_price, MAX(bulk_discounts.percentage) as best_discount ")
      .where("invoice_items.quantity >= bulk_discounts.item_threshold")
      .group("invoice_items.id"))
      .sum("quantity*unit_price*best_discount/100.0")
  end

  def discounted_revenue_for_specific_invoice
    total_revenue - discounts_for_specific_invoice
  end
end

