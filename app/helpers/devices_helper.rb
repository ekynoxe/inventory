module DevicesHelper
  
  
  def getAllUsers
    devices = Device.find(:all, :group=>'holder',:conditions => ['holder IS NOT NULL AND holder !=?',' '])
    
    return devices
  end
  
  def getAllTypes
    devices = Device.find(:all, :group=>'devicetype',:conditions => ['devicetype IS NOT NULL AND devicetype !=?',' '])
    
    return devices
  end
  
  def format_borrowed_lent_class(d)
    if d.borrowedfrom && d.borrowedfrom!=''
    	'borrowed'
    end
    if !d.borrower_id.nil? || d.borrower_id==0
    	'lent'
    end 
  end
  
  def to_lend_to_list
    holders = @global_holders.map{ |h| [h.name, h.id] }
    list =holders.unshift(['external lend', 0])
  end
end
