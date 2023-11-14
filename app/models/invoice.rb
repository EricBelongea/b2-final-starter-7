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

  def merchant_invoice_revenue(merchant_id)
    Invoice.select("merchant_revenue")
            .from(invoice_items
            .joins(item: :merchant)
            .select("SUM(invoice_items.quantity*invoice_items.unit_price) AS merchant_revenue")
            .where("items.merchant_id = #{merchant_id}")
            .group("invoice_items.id"))
            .sum("merchant_revenue")
  end

  def discounts_for_specific_invoice
    Invoice
    .select("quantity, unit_price, best_discount")
    .from(invoice_items
      .joins(:bulk_discounts)
      .select("invoice_items.id, invoice_items.quantity, invoice_items.unit_price, MAX(bulk_discounts.percentage) as discount")
      .where("invoice_items.quantity >= bulk_discounts.quantity")
      .group("invoice_items.id"))
      .sum("quantity*unit_price*discount/100.0")
  end

  def discounted_revenue
    total_revenue - discounts_for_specific_invoice
  end
end

