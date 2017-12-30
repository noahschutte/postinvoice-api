class VendorsController < ApplicationController

  def index
    vendors = Vendor.all
    
    render :status => :ok, :json => {
      vendors: vendors
    }
  end

end
