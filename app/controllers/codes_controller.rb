class CodesController < ApplicationController

  def index
    codes = Code.all

    render :status => :ok, :json => {
      codes: codes
    }
  end

end
