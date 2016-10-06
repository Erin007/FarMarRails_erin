class SalesController < ApplicationController
  def sale
    @sale ||= Sale.find(params[:id].to_i)
  end

  def index
    @sales = Sale.all
  end

  def new
    @vendor = Vendor.find(params[:vendor_id].to_i)
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(amount:params[:amount], purchase_time:params[:purchase_time], product_id:params[:product_id], vendor_id:params[:vendor_id])
    @sale.save

    if @sale.save
        redirect_to index_path, alert: "Sale successfully added."
    else
        redirect_to new_path, alert: "Error adding sale."
    end
  end

  def edit
    sale
  end

  def update
    sale.update_attributes(sale_params)
    redirect_to index_path
  end

  def destroy
    sale.destroy
    redirect_to request.referrer
  end

  def show
    @sales = Sale.all
    @sale_of_interest = nil

    @sales.each do |sale|
    number = params[:id].to_i

      if sale[:id] == number
        @sale_of_interest = sale
      end
    end

    if @sale_of_interest == nil
      @sale_of_interest = { id: params[:id].to_i, amount: "That sale was not found", purchse_time: "", vendor_id: "", product_id: ""}
    end
  end

private
  def sale_params
     #Tells Rails which parameters can be changed
     params.require(:sale).permit(:id, :amount, :purchse_time, :vendor_id, :product_id)
   end
end
