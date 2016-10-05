class VendorsController < ApplicationController

  def vendor
    @vendor ||= Vendor.find(params[:id].to_i)
  end

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(id: params[:id].to_i, name: params[:name], num_employees: params[:num_employees].to_i, market_id: params[:market_id].to_)
    @vendor.save

    if @vendor.save
        redirect_to index_path, alert: "Vendor successfully added."
    else
        redirect_to new_path, alert: "Error adding vendor."
    end
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
