class VendorsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def vendor
    @vendor ||= Vendor.find(params[:id].to_i)
  end
end
