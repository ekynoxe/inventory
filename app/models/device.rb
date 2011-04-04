class Device < ActiveRecord::Base
  belongs_to  :project
  belongs_to  :holder
  belongs_to  :device_type
  
  belongs_to   :borrower, :class_name=>"Holder"
  
  validates_presence_of :holder_id
  validates_presence_of :description
  validates_presence_of :project_id
  validates_presence_of :device_type_id
  
  validates_numericality_of :imei, :message=>"should only contain numbers", :allow_nil=>true
  
  validates_presence_of     :lent_to_details, :message=>"please say whom you lent the device to", :if =>Proc.new { |device| device.borrower_id == 0 }
  
  #THIS CAN BE DONE WITH SEARCH LOGIC!!!
  def self.search(search, per_page, page)
    
    paginate  :per_page => per_page, :page => page,
              :conditions => ['description like ?', "%#{search}%"],
              :order => 'description'
  end
  
  def format_serial_numbers
    imei = serial = separator = ''
    if self.imei
      imei = 'IMEI:'+self.imei.to_s
    end
    if self.serialnumber
      serial ='Serial No:'+ self.serialnumber.to_s
    end
    
    if self.imei && self.serialnumber
      separator=' / '
    end
    
    imei+separator+serial
  end
  
end
