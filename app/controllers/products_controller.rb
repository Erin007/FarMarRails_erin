class ProductsController < ApplicationController

  def product
    @product ||= Product.find(params[:id].to_i)
  end

  def index
    @products = Product.all
  end

  def new
    @vendor = Vendor.find(params[:vendor_id].to_i)
    @product = Product.new
  end

  def create
    @product = Product.new(name:params[:product][:name], vendor_id:params[:vendor_id].to_i)
    if @product.save!
         redirect_to controller: 'vendors', action: 'show', id:params[:vendor_id].to_i
    else
        redirect_to new_path, alert: "Error adding product."
    end
  end

  def edit
    product
  end

  def update
    product.update_attributes(product_params)
    redirect_to index_path
  end

  def destroy
    product.destroy
    redirect_to request.referrer
  end

  def show
  end

private
 def product_params
   #Tells Rails which parameters can be changed
   params.require(:product).permit( :name, :vendor_id)
 end

end
