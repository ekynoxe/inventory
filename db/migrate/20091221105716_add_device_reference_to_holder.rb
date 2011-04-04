class AddDeviceReferenceToHolder < ActiveRecord::Migration
  def self.up
      add_column :devices, :holder_id, :integer
  end

  def self.down
    remove_column :devices, :holder_id
  end
end
