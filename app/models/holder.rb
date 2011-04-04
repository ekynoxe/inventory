class Holder < ActiveRecord::Base
  acts_as_authentic { |c|
    c.validate_email_field = false
  } 
  
  belongs_to  :team
  has_many    :devices
  has_many    :device_requests, :class_name=>"DeviceRequest", :foreign_key=>"requesting_holder_id"
  has_many    :received_device_requests, :class_name=>"DeviceRequest", :foreign_key=>"requested_holder_id"
  has_many    :activities, :through=>:activity_logs
  has_many    :holiday_bookings
  
  validates_presence_of   :name
  validates_presence_of   :team_id
  validates_presence_of   :email
  validates_uniqueness_of :email
  validates_format_of     :email,
                          :with       => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                          :message    => 'email must be valid'
                        
  def isAdmin
    return self.admin
  end
  
  
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    Notifier.deliver_password_reset_instructions(self)  
  end
  
  def booked_holidays
    self.holiday_bookings.sum(:nb_days)
  end
  
  def remaining_holidays
    self.year_holidays + self.transferred_holidays - self.holiday_bookings.sum(:nb_days)
  end
end
