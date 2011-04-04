class ActivityLog < ActiveRecord::Base
  belongs_to  :holder
  belongs_to  :activity

  has_one     :device
end
