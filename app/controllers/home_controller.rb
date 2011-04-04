class HomeController < ApplicationController
  before_filter :require_holder, :setVars
  
  def index
    @nb_devices = Device.all.size
  end
end
