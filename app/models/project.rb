class Project < ActiveRecord::Base
  belongs_to :team
  has_many :holders
  has_many :devices, :through=>:holders
  
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :team_id
end
