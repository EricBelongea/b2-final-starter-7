class BulkDiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
    @discount = BulkDiscount.find(params[:id])
    @merchant = Merchant.find(params[:merchant_id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def edit
    @discount = BulkDiscount.find(params[:id])
    @merchant = Merchant.find(params[:merchant_id])
  end
  
  def update
    discount = BulkDiscount.find(discount_params[:id])
    merchant = Merchant.find(params[:merchant_id])
    if discount.update(discount_params)
      redirect_to "/merchants/#{merchant.id}/bulk_discounts/#{discount.id}"
    else
      flash[:alert] = "Please make sure you fill in all the fields correctly"
      redirect_back(fallback_location: "/merchants/#{merchant.id}/bulk_discounts/#{discount.id}/edit")
    end
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    @merchant.bulk_discounts.create({
      name: params[:discount_name],
      quantity: params[:discount_quantity],
      percentage: params[:discount_percentage]
    })
    if @merchant.save
      flash[:alert] = "Discount Created Successfully"
      redirect_to "/merchants/#{@merchant.id}/bulk_discounts"
    else
      flash[:alert] = "Please make sure you fill in all the fields correctly"
      redirect_back(fallback_location: "/merchants/#{@merchant.id}/bulk_discounts/new")
    end
  end

  def destroy
    BulkDiscount.find(params[:id]).destroy
    redirect_back(fallback_location: "/merchants/#{params[:merchant_id]}/bulk_discounts")
  end

  private

  def discount_params
    params.permit(:id, :name, :quantity, :percentage)
  end
end