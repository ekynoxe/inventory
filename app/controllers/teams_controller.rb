class TeamsController < ApplicationController
  before_filter :require_admin, :setVars
  before_filter :store_location, :except=>[:new,:edit]
  
  def index
    @teams = Team.find(:all,:order=>'name')
  end
  
  def new
    @team = Team.new
  end
  
  def create
    @team=Team.new(params[:team])
    
    if @team.save
      redirect_to teams_url
    else
      render :action => :new
    end
  end
  
  def edit
    @team = Team.find(params[:id])
  end
  
  def update
    if @team=Team.find(params[:id])
      if @team.update_attributes(params[:team])
      redirect_to teams_url
      else
        render :action => :edit
      end
    else
      redirect_to teams_url
    end
  end
end
