class VendorsController < ApplicationController

  def vendor
    @vendor ||= Vendor.find(params[:id].to_i)
  end

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new

    @market = Market.find(params[:market_id])
  end

  def create
    @vendor = Vendor.new(name: params[:vendor][:name], num_employees: params[:vendor][:num_employees], market_id: params[:vendor][:market_id])
    @vendor.save
    redirect_to market_url(params[:vendor][:market_id])
  end

  def show
    @vendors = Vendor.all
    @vendor_of_interest = nil

    @vendors.each do |vendor|
    number = params[:id].to_i

      if vendor[:id] == number
        @vendor_of_interest = vendor
      end
    end

    if @vendor_of_interest == nil
      @vendor_of_interest = { id: params[:id].to_i, title: "That vendor was not found", num_employees: "", market_id: ""}
    end
  end

  def edit
    vendor
  end

  def update
    vendor.update_attributes(vendor_params)
    redirect_to request.referrer
  end

  def destroy
    vendor.destroy
  end

  def products_list
    product_names = []
    vendor.product_ids.each do |product_id|
      product = Product.find(product_id)
      product_names << product.name
    end
    return product_names
  end

private
   def vendor_params
     #Tells Rails which parameters can be changed
     params.require(:id).permit(:name, :num_employees, :market_id)

  end

end
