class CreateHolderSessions < ActiveRecord::Migration
  def self.up
    create_table :holder_sessions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :holder_sessions
  end
end
