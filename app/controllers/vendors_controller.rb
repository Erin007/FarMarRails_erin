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
    @vendor = Vendor.new( name:params[:vendor][:name], num_employees:params[:vendor][:num_employees].to_i, market_id:params[:vendor][:market_id].to_i)
    @vendor.save

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

  def products
    names = []
    product_ids_for_this_vendor = @vendor_of_interest.product_ids
    product_ids_for_this_vendor.each do |id|
      product_objects = Product.find(id)
      names << product_objects.name

    end
  end

  def products_listed

  end

  private
   def vendor_params
     #Tells Rails which parameters can be changed
     params.require(:id).permit(:name, :num_employees, :market_id)
   end

end
