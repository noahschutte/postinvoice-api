class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_filter :cors_preflight_check

  def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = '*'
  end
end
