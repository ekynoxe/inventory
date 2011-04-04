class DeviceRequestsController < ApplicationController
  before_filter :require_holder, :setVars
  before_filter :store_location, :only=>[:index]
  
  before_filter :find_device_by_id, :except=>[:index]
  
  def index
    @received_device_requests = current_holder.received_device_requests.paginate :page => params[:page], :per_page => params[:per_page]
    @sent_device_requests = current_holder.device_requests.paginate :page => params[:page], :per_page => params[:per_page]
  end
  
  def new
    @device_request = current_holder.device_requests.new(:device_id=>@device.id)
  end
  
  def create
    @device_request = current_holder.device_requests.build(:device_id=>@device.id,:requesting_holder_id=>params[:device_request][:requesting_holder_id],:requested_holder_id=>params[:device_request][:requested_holder_id])
    if @device_request.save
      flash[:notice]='Your request has been sent'
      
      Notifier.deliver_device_request(current_holder,@device)
        
      redirect_to session[:return_to] || devices_url
    else
      render new
    end
  end
  
  def destroy
    if @device_request = current_holder.device_requests.find(params[:id])
      @device_request.destroy
    end
    redirect_to session[:return_to] || devices_url
  end
  
  private
  
  def find_device_by_id
    begin
      @device = Device.find(params[:id])
    rescue
      redirect_to session[:return_to] || devices_url
    end
  end
end