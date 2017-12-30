class CodesController < ApplicationController

  def index
    codes = []

    Code.all.each do |code|
      codes.push(
        {
          id: code.id,
          name: code.name
        }
      )
    end

    render :status => :ok, :json => {
      codes: codes
    }
  end

end
