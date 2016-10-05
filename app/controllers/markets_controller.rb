class MarketsController < ApplicationController
  def index
    @market = Market.all
  end

  def new
  end

  def create
  end

  def show
    @market = Market.find(params[:id].to_i)
    @vendor = Vendor.where(market_id: params[:id].to_i)
  end

  def edit
    @market = market
  end

  def update
    market.name = params[:market][:name]
    market.address = params[:market][:address]
    market.city = params[:market][:city]
    market.county = params[:market][:county]
    market.state = params[:market][:state]
    market.zip = params[:market][:zip]
    market.save
    redirect_to :markets_show
  end

  def destroy
    market.destroy
    redirect_to :markets
  end

  def market
    @market ||= Market.find(params[:id].to_i)
  end
end
