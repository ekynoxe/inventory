class AddColumnReturned < ActiveRecord::Migration
  def self.up
    add_column      :devices, :returned, :date
  end

  def self.down
    removed_column  :devices, :returned
  end
end
