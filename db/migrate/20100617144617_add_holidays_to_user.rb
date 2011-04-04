class AddHolidaysToUser < ActiveRecord::Migration
  def self.up
    add_column :holders, :year_holidays, :int, :default => 25, :null => false
    add_column :holders, :transferred_holidays, :int, :default => 0, :null => false
  end

  def self.down
    remove_column :holders, :year_holidays
    remove_column :holders, :transferred_holidays
  end
end
