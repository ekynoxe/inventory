class CreateHolders < ActiveRecord::Migration
  def self.up
    create_table :holders do |t|
      t.string      :name
      t.string      :email

      t.timestamps
    end
  end

  def self.down
    drop_table :holders
  end
end
