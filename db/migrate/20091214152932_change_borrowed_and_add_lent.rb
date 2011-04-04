class ChangeBorrowedAndAddLent < ActiveRecord::Migration
  def self.up
    rename_column :devices, :borrowedto, :borrowedfrom
    add_column    :devices, :lentto, :string
  end

  def self.down
    rename_column :devices, :borrowedfrom, :borrowedto
    remove_column :devices, :lentto
  end
end
