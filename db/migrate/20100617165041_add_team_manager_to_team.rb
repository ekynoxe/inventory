class AddTeamManagerToTeam < ActiveRecord::Migration
  def self.up
    add_column  :teams, :team_manager_id, :int, :null=>:false
  end

  def self.down
    remove_column  :teams, :team_manager_id
  end
end
