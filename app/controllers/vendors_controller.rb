class VendorsController < ApplicationController

  def index
    vendors = []

    Vendor.all.each do |vendor|
      vendors.push(
        {
          id: vendor.id,
          name: vendor.name
        }
      )
    end

    render :status => :ok, :json => {
      vendors: vendors
    }
  end

end
