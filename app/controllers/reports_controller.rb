class ReportsController < ApplicationController

  def index
    render :json => {
      message: 'incomplete reports index route'
    }
  end

end
