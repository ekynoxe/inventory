class DevicesController < ApplicationController
  before_filter :require_holder, :setVars
  before_filter :store_location, :except=>[:new, :edit, :update]
  
  def index
    if !params[:per_page]
      params[:per_page] = 10
    end
    
    conditions = Array.new
    if params[:project_id]
      conditions = ["project_id=?", "#{params[:project_id]}"]
    end
  
    if params[:holder_id]
      conditions = ["holder_id=?", "#{params[:holder_id]}"]
    end
  
    if params[:device_type_id]
      conditions = ["device_type_id = ?", "#{params[:device_type_id]}"]
    end
    
    if params[:tags]
      cond = []
      cond << ["description LIKE ?", "%"+params[:tags]+"%"]
      cond << ["comments LIKE ?", "%"+params[:tags]+"%"]
      cond << ["borrowedfrom LIKE ?", "%"+params[:tags]+"%"]
      cond << ["imei LIKE ?", "%"+params[:tags]+"%"]
      cond << ["serialnumber LIKE ?", "%"+params[:tags]+"%"]
      conditions = cond.map { |c| Device.merge_conditions(c) }.join(' OR ')
    end
    
#    @devices = @global_team.devices.paginate :page => params[:page], :per_page => params[:per_page], :conditions => conditions
    @devices = Device.paginate :page => params[:page], :per_page => params[:per_page], :conditions => conditions
    
    if request.xml_http_request?
      render :partial => "devices/device_details", :layout => false
    end
  end
  
  def mydevices
    redirect_to holderdevices_url(current_holder)
  end
  
  def new
    @device = Device.new
    @new=true
  end
  
  def create
    @device=Device.create(params[:device])
    
    if @device.save
      redirect_to root_url
    else
      @new=true
      render :action => :new
    end
  end
  
  def edit
    @new=false
    if !@device=Device.find(params[:id])
      redirect_to(root_url)
    end
    
    if(!isAdmin? && current_holder.id != @device.holder.id)
      store_location
      flash[:notice] = "You are not the holder of this device"
      redirect_to(root_url)
    end
  end
  
  def update
    if @device=Device.find(params[:id])
      email = @device.holder.id != params[:device][:holder_id].to_i ? true : false
      
      if @device.update_attributes(params[:device])
        #search for a request RECEIVED for this device and the holder_id in the parameters
        # => if found, delete it
        requests = current_holder.received_device_requests.find(:all,:conditions=>["device_id=? AND requesting_holder_id = ?", params[:id],params[:device][:holder_id]])
        requests.each do |e|
          e.destroy
        end
        
        @device.reload
      
        Notifier.deliver_device_assignment_notification(current_holder,@device) unless !email
        
        redirect_back_or_default root_url
      else
        render :action => :edit
      end
    else
      redirect_back_or_default root_url
    end
  end
  
end
