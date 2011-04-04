class ChangeImeiAsBigint < ActiveRecord::Migration
  def self.up
    change_column :devices, :imei, :integer, :limit=>5
  end

  def self.down
    change_column :devices, :imei, :integer
  end
end
