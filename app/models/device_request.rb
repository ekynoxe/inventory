class DeviceRequest < ActiveRecord::Base
  belongs_to  :device
  belongs_to  :requesting_holder,  :class_name=>"Holder"
  belongs_to  :requested_holder,  :class_name=>"Holder"
end