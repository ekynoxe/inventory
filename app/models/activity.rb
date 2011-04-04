class Activity < ActiveRecord::Base
  has_many  :holders, :through=>:activity_logs
end