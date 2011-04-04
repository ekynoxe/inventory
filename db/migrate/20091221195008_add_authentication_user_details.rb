class AddAuthenticationUserDetails < ActiveRecord::Migration
  def self.up
    add_column  :holders, :crypted_password, :string,  :null => false
    add_column  :holders, :password_salt, :string,  :null => false
    add_column  :holders, :persistence_token, :string,  :null => false
  end

  def self.down
    remove_column  :holders, :crypted_password
    remove_column  :holders, :password_salt
    remove_column  :holders, :persistence_token
  end
end
