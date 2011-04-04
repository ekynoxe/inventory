class CreateDevices < ActiveRecord::Migration
  def self.up
    create_table :devices do |t|
      t.string      :type
      t.string      :description
      t.integer     :imei
      t.date        :received
      t.string      :serialnumber
      t.string      :borrowedto
      t.string      :holder
      t.text        :comments
      t.references  :project

      t.timestamps
    end
  end

  def self.down
    drop_table :devices
  end
end
