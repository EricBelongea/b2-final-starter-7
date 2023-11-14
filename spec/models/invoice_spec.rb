require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "validations" do
    it { should validate_presence_of :status }
    it { should validate_presence_of :customer_id }
  end
  describe "relationships" do
    it { should belong_to :customer }
    it { should have_many(:items).through(:invoice_items) }
    it { should have_many(:merchants).through(:items) }
    it { should have_many :transactions}
  end
  describe "instance methods" do
    it "total_revenue" do
      @merchant1 = Merchant.create!(name: 'Hair Care')
      @item_1 = Item.create!(name: "Shampoo", description: "This washes your hair", unit_price: 10, merchant_id: @merchant1.id, status: 1)
      @item_8 = Item.create!(name: "Butterfly Clip", description: "This holds up your hair but in a clip", unit_price: 5, merchant_id: @merchant1.id)
      @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Smith')
      @invoice_1 = Invoice.create!(customer_id: @customer_1.id, status: 2, created_at: "2012-03-27 14:54:09")
      @ii_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 9, unit_price: 10, status: 2)
      @ii_11 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_8.id, quantity: 1, unit_price: 10, status: 1)

      expect(@invoice_1.total_revenue).to eq(100)
    end
  end

  it "Can calculate discounts on an invoice for a merhcant" do
    merchant1 = Merchant.create!(name: "Merchant 1")
    customer1 = Customer.create!(first_name: "Rick",last_name: "Sanchez" )
    item1 = Item.create!(name: "Plumbus", description: "It's a thing", unit_price: 100, merchant_id: merchant1.id)
    invoice1 = Invoice.create!(customer_id: customer1.id ,status: 2)
    invoice_item1 = InvoiceItem.create!(quantity: 10, unit_price: 20, status: 2, invoice_id: invoice1.id, item_id: item1.id)
    bulk_discount1 = BulkDiscount.create!(name: "discount10", quantity: 10, percentage: 10, merchant_id: merchant1.id)

    expect(invoice1.discounted_revenue_for_specific_invoice).to eq(20)
  end
end
