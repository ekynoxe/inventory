module HolidayBookingsHelper
  
  def format_validated_class(h)
    if !h.validated
    	'lent'
    end
  end
end
