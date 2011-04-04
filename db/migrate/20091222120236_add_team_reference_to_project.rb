class AddTeamReferenceToProject < ActiveRecord::Migration
  def self.up
      add_column :projects, :team_id, :integer, :default=>0
  end

  def self.down
    remove_column :projects, :team_id
  end
end
