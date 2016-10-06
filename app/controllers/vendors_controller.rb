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
    @vendor = Vendor.new(name: params[:vendor][:name], num_employees: params[:vendor][:num_employees], market_id: params[:vendor][:market_id])
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

  def destroy_product
    @product = Product.find(params[:id])
    @product.destroy
  end

  private
   def vendor_params
     #Tells Rails which parameters can be changed
     params.require(:id).permit(:name, :num_employees, :market_id)
   end

end
