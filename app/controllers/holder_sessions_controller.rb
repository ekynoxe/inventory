class HolderSessionsController < ApplicationController
  before_filter :require_no_holder, :except=>:destroy
  
  def new
    @holder_session = HolderSession.new
  end

  def create
    @holder_session = HolderSession.new(params[:holder_session])
    if @holder_session.save
      redirect_to root_url
    else
      render :action => :new
    end
  end

  def destroy
    current_holder_session.destroy
    redirect_to login_url
  end
end