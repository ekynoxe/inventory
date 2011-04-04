class AddPasswordResetFields < ActiveRecord::Migration
  def self.up
    add_column :holders, :perishable_token, :string, :default => "", :null => false
    add_index :holders, :perishable_token
  end

  def self.down
    remove_column :users, :perishable_token
  end
end