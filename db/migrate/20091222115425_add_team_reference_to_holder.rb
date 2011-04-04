class AddTeamReferenceToHolder < ActiveRecord::Migration
  def self.up
      add_column :holders, :team_id, :integer, :default=>0
  end

  def self.down
    remove_column :holders, :team_id
  end
end
