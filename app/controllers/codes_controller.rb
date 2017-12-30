class CodesController < ApplicationController

  def index
    codes = Code.where(deleted_at: nil)

    render :status => :ok, :json => {
      codes: codes
    }
  end

end
