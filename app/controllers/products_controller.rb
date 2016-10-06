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
        redirect_to vendors_path, alert: "Product successfully added."
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
    redirect_to vendors_path
  end

  def show
  end

private
 def product_params
   #Tells Rails which parameters can be changed
   params.require(:product).permit(:id, :name, :vendor_id)
 end

end
