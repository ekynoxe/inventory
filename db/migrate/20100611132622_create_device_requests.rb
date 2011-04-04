class CreateDeviceRequests < ActiveRecord::Migration
  def self.up
    create_table :device_requests do |t|
      t.references  :device
      t.integer     :requesting_holder_id
      t.integer     :requested_holder_id

      t.timestamps
    end
  end

  def self.down
    drop_table :device_requests
  end
end
