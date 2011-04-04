class CreateHolidayBookings < ActiveRecord::Migration
  def self.up
    create_table    :holiday_bookings do |t|
      t.float       :nb_days, :default=>0, :null=>false
      t.date        :start_date
      t.date        :end_date
      t.boolean     :validated, :default=>0, :null=>false
      t.references  :holder
      
      t.timestamps
    end
  end

  def self.down
    drop_table :holiday_bookings
  end
end
