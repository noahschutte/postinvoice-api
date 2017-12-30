class VendorsController < ApplicationController

  def index
    vendors = Vendor.where(deleted_at: nil)

    render :status => :ok, :json => {
      vendors: vendors
    }
  end

end
