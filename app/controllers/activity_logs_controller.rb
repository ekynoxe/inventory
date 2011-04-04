class ActivityLogsController < ApplicationController
  before_filter :require_holder, :setVars
  before_filter :store_location, :except=>[:new, :edit, :update]

  def index
    @activity_logs = ActivityLog.paginate :page => params[:page], :per_page => params[:per_page]
  end
end
