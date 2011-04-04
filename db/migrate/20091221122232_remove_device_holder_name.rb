class RemoveDeviceHolderName < ActiveRecord::Migration
  def self.up
    remove_column :devices, :holder
  end

  def self.down
    add_column :devices, :holder, :string
  end
end
