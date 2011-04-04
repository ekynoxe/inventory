ActionController::Routing::Routes.draw do |map|
  
  map.login             'login',                                  :controller => 'holder_sessions', :action => 'new'
  map.logout            'logout',                                 :controller => 'holder_sessions', :action => 'destroy'
  
  map.mydevices         'mydevices',                             :controller => 'devices',         :action => 'mydevices',   :conditions => { :method => :get }
  map.holderdevices     'devices/holders/:holder_id',             :controller => 'devices',         :action => 'index',   :conditions => { :method => :get }
  map.holdersdevices    'devices/holders/',                       :controller => 'devices',         :action => 'index',   :conditions => { :method => :get }
  map.projectdevices    'devices/projects/:project_id',           :controller => 'devices',         :action => 'index',   :conditions => { :method => :get }
  map.projectsdevices   'devices/projects/',                      :controller => 'devices',         :action => 'index',   :conditions => { :method => :get }
  map.typedevices       'devices/device_types/:device_type_id',   :controller => 'devices',         :action => 'index',   :conditions => { :method => :get }
  map.typesdevices      'devices/device_types/',                  :controller => 'devices',         :action => 'index',   :conditions => { :method => :get }

  map.request_device    'devices/:id/request',                    :controller => 'device_requests',         :action => 'new',     :conditions => { :method => :get }
  map.request_device    'devices/:id/request',                    :controller => 'device_requests',         :action => 'create',  :conditions => { :method => :post }
  
  map.search            'devices/search/',                        :controller => 'devices',         :action => 'index',   :conditions => { :method => :get }

  map.holder_change_password_index   'holders/:holder_id/change_password',            :controller =>'change_password', :action=>'index',        :conditions => { :method => :get }
  map.connect   'holders/:holder_id/change_password',            :controller =>'change_password', :action=>'update',        :conditions => { :method => :put }

  map.resources :devices
  map.resources :holders
  map.resources :projects
  map.resources :device_types
  map.resources :holder_sessions
  map.resources :teams
  map.resources :device_requests
  map.resources :password_resets
  map.resources :holiday_bookings
    
   map.root :controller => "home"
end
