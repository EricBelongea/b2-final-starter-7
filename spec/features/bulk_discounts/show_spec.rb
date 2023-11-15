require "rails_helper"

RSpec.describe "Bulk Discounts Show" do
  before(:each) do
    # @customer1 = Customer.create!(first_name: "John", last_name: "Doe")
    # @invoice1 = @customer1.invoices.create!(status: 1, created_at: "2023-10-01 UTC")
    # @transaction1 = @invoice1.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1, invoice_id: "#{@invoice1.id}")
    # @transaction2 = @invoice1.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1, invoice_id: "#{@invoice1.id}")
    # @transaction3 = @invoice1.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1, invoice_id: "#{@invoice1.id}")
    # @transaction4 = @invoice1.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1, invoice_id: "#{@invoice1.id}")

    # @customer2 = Customer.create!(first_name: "Mary", last_name: "Jane")
    # @invoice2 = @customer2.invoices.create!(status: 1, created_at: "2023-10-02 UTC")
    # @invoice3 = @customer2.invoices.create!(status: 2, created_at: "2023-10-02 UTC")
    # @transaction5 = @invoice2.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
    # @transaction6 = @invoice2.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
    # @transaction7 = @invoice2.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)

    # @customer3 = Customer.create!(first_name: "Johnny", last_name: "Bowflex")
    # @invoice4 = @customer3.invoices.create!(status: 1)
    # @invoice5 = @customer3.invoices.create!(status: 0)
    # @invoice6 = @customer3.invoices.create!(status: 0)
    # @invoice7 = @customer3.invoices.create!(status: 2)
    # @invoice4 = @customer3.invoices.create!(status: 1, created_at: "2023-10-03 UTC")
    # @invoice5 = @customer3.invoices.create!(status: 0, created_at: "2023-10-03 UTC")
    # @invoice6 = @customer3.invoices.create!(status: 0, created_at: "2023-10-03 UTC")
    # @invoice7 = @customer3.invoices.create!(status: 2, created_at: "2023-10-03 UTC")
    # @transaction8 = @invoice4.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
    # @transaction9 = @invoice4.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
    # @transaction10 = @invoice4.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
    # @transaction11 = @invoice4.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
    # @transaction12 = @invoice4.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)

    # @customer4 = Customer.create!(first_name: "Alvin", last_name: "Setter")
    # @invoice8 = @customer4.invoices.create!(status: 1)
    # @invoice9 = @customer4.invoices.create!(status: 0)
    # @invoice10 = @customer4.invoices.create!(status: 2)
    # @invoice8 = @customer4.invoices.create!(status: 1, created_at: "2023-10-04 UTC")
    # @invoice9 = @customer4.invoices.create!(status: 0, created_at: "2023-10-04 UTC")
    # @invoice10 = @customer4.invoices.create!(status: 2, created_at: "2023-10-04 UTC")
    # @transaction13 = @invoice8.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
    # @transaction14 = @invoice8.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
    # @transaction15 = @invoice8.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)
    # @transaction16 = @invoice8.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 1)

    # @customer5 = Customer.create!(first_name: "Masison", last_name: "House")
    # @invoice11 = @customer5.invoices.create!(status: 1, created_at: "2023-10-05 UTC")
    # @invoice12 = @customer5.invoices.create!(status: 2, created_at: "2023-10-05 UTC")
    # @invoice13 = @customer5.invoices.create!(status: 2, created_at: "2023-10-05 UTC")
    # @invoice14 = @customer5.invoices.create!(status: 0, created_at: "2023-10-05 UTC")
    # @transaction17 = @invoice11.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 0, created_at: "2023-10-05 UTC")
    # @transaction18 = @invoice11.transactions.create!(credit_card_number: "1234567890", credit_card_expiration_date: "4/27", result: 0, created_at: "2023-10-05 UTC")

    @merchant1 = Merchant.create!(name: "m1")
    # @merchant2 = create(:merchant, name: "m2")
    # @merchant3 = create(:merchant, name: "m3")
    # @merchant4 = create(:merchant, name: "m4")
    # @merchant5 = create(:merchant, name: "m5")
    # @merchant6 = create(:merchant, name: "m6")

    # @item1 = create(:item, merchant_id: @merchant1.id)
    # @item2 = create(:item, merchant_id: @merchant1.id)
    # @item3 = create(:item, merchant_id: @merchant2.id)
    # @item3 = create(:item, merchant_id: @merchant2.id)
    # @item4 = create(:item, merchant_id: @merchant3.id)
    # @item5 = create(:item, merchant_id: @merchant3.id)
    # @item6 = create(:item, merchant_id: @merchant4.id)
    # @item7 = create(:item, merchant_id: @merchant4.id)
    # @item8 = create(:item, merchant_id: @merchant5.id)

    # @invoice_item_1 = create(:invoice_item, status: 0, unit_price: 500, invoice_id: @invoice1.id, item_id: @item1.id)
    # @invoice_item_2 = create(:invoice_item, status: 0, unit_price: 300, invoice_id: @invoice2.id, item_id: @item2.id)
    # @invoice_item_3 = create(:invoice_item, status: 0, unit_price: 100, invoice_id: @invoice2.id, item_id: @item3.id)
    # @invoice_item_4 = create(:invoice_item, status: 0, unit_price: 100, invoice_id: @invoice4.id, item_id: @item4.id)
    # @invoice_item_5 = create(:invoice_item, status: 0, unit_price: 500, invoice_id: @invoice4.id, item_id: @item5.id)
    # @invoice_item_6 = create(:invoice_item, status: 0, unit_price: 200, invoice_id: @invoice4.id, item_id: @item6.id)
    # @invoice_item_7 = create(:invoice_item, status: 0, unit_price: 100, invoice_id: @invoice8.id, item_id: @item7.id)
    # @invoice_item_8 = create(:invoice_item, status: 0, unit_price: 100, invoice_id: @invoice11.id, item_id: @item8.id)
  
    @discount1 = @merchant1.bulk_discounts.create(name: "Ten4Ten", quantity: 10, percentage: 10)
  end

  describe '#US4' do
    it 'Can edit Discounts' do
      # visit "/merchants/#{@merchant1.id}/bulk_discounts"
      visit merchant_bulk_discounts_path(@merchant1.id)

      expect(page).to have_content("Welcome #{@merchant1.name}")
      expect(page).to have_link("Create a Discount")

      expect(page).to have_link("#{@discount1.name}")
      expect(page).to have_button("Delete")
      expect(page).to have_content("Quantity Threshold: #{@discount1.quantity}")
      expect(page).to have_content("Percentage Off: #{@discount1.percentage}")

      click_link("#{@discount1.name}")
      expect(current_path).to eq(merchant_bulk_discount_path(@merchant1.id, @discount1.id))
      

      visit merchant_bulk_discount_path(@merchant1.id, @discount1.id)

      expect(page).to have_content("#{@merchant1.name}")
      expect(page).to have_content("#{@discount1.name}")
      expect(page).to_not have_button("Delete")
      expect(page).to have_content("Quantity Threshold: #{@discount1.quantity}")
      expect(page).to have_content("Percentage: #{@discount1.percentage}")
    end
  end

  describe '#US5' do
    it 'Can edit on Discount show page' do
      visit merchant_bulk_discount_path(@merchant1.id, @discount1.id)

      expect(page).to have_content("#{@discount1.name}")
      expect(page).to have_content("Quantity Threshold: #{@discount1.quantity}")
      expect(page).to have_content("Percentage: #{@discount1.percentage}")

      expect(page).to have_link("Edit #{@discount1.name}")

      click_link("Edit #{@discount1.name}")
      expect(current_path).to eq(edit_merchant_bulk_discount_path(@merchant1.id, @discount1.id))

      visit edit_merchant_bulk_discount_path(@merchant1.id, @discount1.id)

      expect(page).to have_content("Name: ")
      expect(page).to have_field("Name", with: @discount1.name)
      expect(page).to have_content("Quantity Threshold: ")
      expect(page).to have_field("Quantity Threshold", with: @discount1.quantity)
      expect(page).to have_content("Percentage:")
      expect(page).to have_field("Percentage", with: @discount1.percentage)
      expect(page).to have_button("Edit")

      fill_in(:percentage, with: 50)
      click_button("Edit")
      expect(current_path).to eq(merchant_bulk_discount_path(@merchant1.id, @discount1.id))

      visit merchant_bulk_discount_path(@merchant1.id, @discount1.id)

      expect(page).to have_content("Quantity Threshold: #{@discount1.quantity}")
      expect(page).to have_content("Percentage: 50")
    end

    it "Form Edgecase Testing - Name" do
      visit new_merchant_bulk_discount_path(@merchant1.id)

      fill_in(:discount_name, with: "")
      fill_in(:discount_quantity, with: 10)
      fill_in(:discount_percentage, with: 100)

      click_button("Submit")

      expect(page).to have_content("Please make sure you fill in all the fields correctly")
      expect(current_path).to eq(new_merchant_bulk_discount_path(@merchant1.id))

      visit edit_merchant_bulk_discount_path(@merchant1.id, @discount1.id)

      fill_in(:name, with: "")
      fill_in(:quantity, with: 10)
      fill_in(:ercentage, with: 100)

      click_button("Edit")

      expect(page).to have_content("Please make sure you fill in all the fields correctly")
      expect(current_path).to eq(edit_merchant_bulk_discount_path(@merchant1.id, @discount1.id))
    end

    it "Form Edgecase Testing - Quantity" do
      visit new_merchant_bulk_discount_path(@merchant1.id)

      fill_in(:discount_name, with: "test")
      fill_in(:discount_quantity, with: 0)
      fill_in(:discount_percentage, with: 100)

      click_button("Submit")

      expect(page).to have_content("Please make sure you fill in all the fields correctly")
      expect(current_path).to eq(new_merchant_bulk_discount_path(@merchant1.id))

      visit new_merchant_bulk_discount_path(@merchant1.id)

      fill_in(:discount_name, with: "test")
      fill_in(:discount_quantity, with: "")
      fill_in(:discount_percentage, with: 100)

      click_button("Submit")

      expect(page).to have_content("Please make sure you fill in all the fields correctly")
      expect(current_path).to eq(new_merchant_bulk_discount_path(@merchant1.id))

      visit edit_merchant_bulk_discount_path(@merchant1.id, @discount1.id)

      fill_in(:name, with: "YeeHaw")
      fill_in(:quantity, with: 0)
      fill_in(:ercentage, with: 100)

      click_button("Edit")

      expect(page).to have_content("Please make sure you fill in all the fields correctly")
      expect(current_path).to eq(edit_merchant_bulk_discount_path(@merchant1.id, @discount1.id))
    end

    it "Form Edgecase Testing - Percentage" do
      visit new_merchant_bulk_discount_path(@merchant1.id)

      fill_in(:discount_name, with: "test")
      fill_in(:discount_quantity, with: 50)
      fill_in(:discount_percentage, with: 105)

      click_button("Submit")

      expect(page).to have_content("Please make sure you fill in all the fields correctly")
      expect(current_path).to eq(new_merchant_bulk_discount_path(@merchant1.id))

      visit new_merchant_bulk_discount_path(@merchant1.id)

      fill_in(:discount_name, with: "test")
      fill_in(:discount_quantity, with: 50)
      fill_in(:discount_percentage, with: 0)

      click_button("Submit")

      expect(page).to have_content("Please make sure you fill in all the fields correctly")
      expect(current_path).to eq(new_merchant_bulk_discount_path(@merchant1.id))

      visit new_merchant_bulk_discount_path(@merchant1.id)

      fill_in(:discount_name, with: "test")
      fill_in(:discount_quantity, with: 0)
      fill_in(:discount_percentage, with: "")

      click_button("Submit")

      expect(page).to have_content("Please make sure you fill in all the fields correctly")
      expect(current_path).to eq(new_merchant_bulk_discount_path(@merchant1.id))

      visit edit_merchant_bulk_discount_path(@merchant1.id, @discount1.id)

      fill_in(:name, with: "YeeHaw")
      fill_in(:quantity, with: 10)
      fill_in(:ercentage, with: 101)

      click_button("Edit")

      expect(page).to have_content("Please make sure you fill in all the fields correctly")
      expect(current_path).to eq(edit_merchant_bulk_discount_path(@merchant1.id, @discount1.id))

      visit edit_merchant_bulk_discount_path(@merchant1.id, @discount1.id)

      fill_in(:name, with: "YeeHaw")
      fill_in(:quantity, with: 10)
      fill_in(:ercentage, with: 0)

      click_button("Edit")

      expect(page).to have_content("Please make sure you fill in all the fields correctly")
      expect(current_path).to eq(edit_merchant_bulk_discount_path(@merchant1.id, @discount1.id))
    end
  end
end