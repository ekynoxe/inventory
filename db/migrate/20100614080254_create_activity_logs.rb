class CreateActivityLogs < ActiveRecord::Migration
  def self.up
    create_table :activity_logs do |t|
      t.references :device
      t.references :holder
      t.references :activity

      t.timestamps
    end
  end

  def self.down
    drop_table :activity_logs
  end
end
