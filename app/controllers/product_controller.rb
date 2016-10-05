class ProductController < ApplicationController

  def product
    @product ||= Product.find(params[:id].to_i)
  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(id: params[:id], name: params[:name], vendor_id: params[:vendor_id])
    @product.save

    if @product.save
        redirect_to index_path, alert: "Product successfully added."
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
   params.require(:product).permit(:id, :name, :vendor_id)
 end

end
