class HoldersController < ApplicationController
  before_filter :require_admin, :only=>:index
  before_filter :require_holder, :setVars
  before_filter :store_location, :except=>[:new,:edit]
  
  def index
    @holders = Holder.paginate :page => params[:page], :per_page => params[:per_page], :order=>'name'
    @devices = Array.new
    
    @holders.each do |h|
      @devices << h.devices
    end
  end
  
  def new
    @holder = Holder.new
  end
  
  def create
    @holder=Holder.new(params[:holder])
    
    if @holder.save
      redirect_to holders_url
    else
      render :action => :new
    end
  end
  
  def show
    if(!isAdmin? && current_holder.id != params[:id].to_i)
      redirect_to root_url
    else
      @holder=Holder.find(params[:id])
    end
  end
  
  def edit
    if(!isAdmin? && current_holder.id != params[:id].to_i)
      redirect_to root_url
    else
      @holder=Holder.find(params[:id])
    end
  end
  
  def update
    if(!isAdmin? && current_holder.id != params[:id].to_i)
      redirect_to root_url
    else
      @holder=Holder.find(params[:id])
      if @holder.update_attributes(params[:holder])
        flash[:notice] = '<p class="notice">your profile has been saved</p>'
        redirect_to edit_holder_url(current_holder)
      else
        render :action => :edit
      end
    end
  end
  
end
