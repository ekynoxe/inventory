class DeviceTypesController < ApplicationController
  before_filter :require_admin, :setVars
  before_filter :store_location, :except=>[:new,:edit]
  
  def index
    @device_types = DeviceType.all
  end
  
  def new
    @device_type = DeviceType.new
  end
  
  def create
    @device_type=DeviceType.new(params[:device_type])
    
    if @device_type.save
      redirect_to device_types_url
    else
      render :action => :new
    end
  end
  
  def edit
    @device_type = DeviceType.find(params[:id])
  end
  
  def update
    if @device_type=DeviceType.find(params[:id])
      if @device_type.update_attributes(params[:device_type])
      redirect_to device_types_url
      else
        render :action => :edit
      end
    else
      redirect_to device_types_url
    end
  end
end
