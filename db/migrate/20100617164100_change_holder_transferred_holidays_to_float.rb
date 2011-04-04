class ChangeHolderTransferredHolidaysToFloat < ActiveRecord::Migration
  def self.up
    change_column :holders, :transferred_holidays, :float, :default=>0
    change_column :holders, :year_holidays, :float, :default=>25
  end

  def self.down
    change_column :holders, :transferred_holidays, :int, :default=>0
    change_column :holders, :year_holidays, :int, :default=>25
  end
end
