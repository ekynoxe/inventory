class RenameTypeToDevicetype < ActiveRecord::Migration
  def self.up
    rename_column :devices, :type, :devicetype
  end

  def self.down
    rename_column :devices, :devicetype, :type
  end
end
