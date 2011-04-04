# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  helper_method :current_holder_session, :current_holder, :isAdmin?, :find_device_request
  
  
  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation
  
  private
  
  def setVars
    @global_team            = current_holder.team
    @global_device_types    = DeviceType.find(:all, :order=>'name')
    @global_projects        = Project.find(:all, :order=>'name')
    @global_holders         = Holder.find(:all, :order=>'name')
    @team_projects          = @global_team.projects.find(:all, :order=>'name')
    @team_holders           = @global_team.holders.find(:all, :order=>'name')
    @device_requests_length = current_holder.received_device_requests.size
  end
  
  def current_holder_session
    return @current_holder_session if defined?(@current_holder_session)
    @current_holder_session = HolderSession.find
  end

  def current_holder
    return @current_holder if defined?(@current_holder)
    @current_holder = current_holder_session && current_holder_session.holder
  end

  def require_holder
    unless current_holder
      if controller_name != 'home'
        store_location
        flash[:notice] = 'You must be logged in to access this page'
      end
      redirect_to login_url
      return false
    end
  end
   
  def require_no_holder
    if current_holder
      store_location
      flash[:notice] = 'You must be logged out to access this page'
      redirect_to root_url
      return false
    end
  end
  
  def require_admin
    unless current_holder && current_holder.isAdmin
      store_location
      flash[:notice] = 'You must be an admin logged in to access this page'
      redirect_to root_url
      return false
    end
  end
  
  def isAdmin?
    return current_holder.isAdmin rescue false
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  def find_device_request(device_id)
    current_holder.device_requests.find(:first,:conditions=>['device_id=?',device_id])
  end
end