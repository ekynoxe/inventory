class Team < ActiveRecord::Base
  has_many  :holders
  has_many  :projects
  has_many  :devices, :through=>:holders
  has_one   :team_manager, :class_name=>"Holder"
  
  validates_presence_of :name
  validates_presence_of :team_manager_id
end
