class AddAdminToHolder < ActiveRecord::Migration
  def self.up
    add_column  :holders, :admin, :boolean,  :default => false
  end

  def self.down
    remove_column  :holders, :admin
  end
end
