class HolidayBooking < ActiveRecord::Base
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :nb_days
  validates_numericality_of :nb_days
  
  belongs_to  :holder
end