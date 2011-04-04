class ChangeLentFieldToHolderReference < ActiveRecord::Migration
  def self.up
    add_column :devices, :lent_to_details, :string
    add_column :devices, :borrower_id, :int

    Device.all.each do |d|
      d.lent_to_details = d.lentto
      d.save
    end
    
    Device.all.each do |d|
      if (d.lentto.nil? || d.lentto.blank? || d.lentto == '')
        d.borrower_id = nil
      else
        d.borrower_id = 0
      end
      d.save
    end
    
    remove_column :devices, :lentto
  end

  def self.down
    add_column :devices, :lentto

    Device.all.each do |d|
      d.lentto = d.lent_to_details
      d.save
    end
    
    remove_column :devices, :lent_to_details
    remove_column :devices, :borrower_id
  end
end
