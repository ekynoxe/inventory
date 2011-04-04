class ProjectsController < ApplicationController
  before_filter :require_holder, :setVars
  before_filter :store_location, :except=>[:new,:edit]
  
  def index
    @projects = Project.paginate :page => params[:page], :per_page => params[:per_page], :order=>'name'
    @devices = Array.new
    
    @projects.each do |p|
      @devices << p.devices
    end
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project=Project.new(params[:project])
    
    if @project.save
      redirect_to projects_url
    else
      render :action => :new
    end
  end
  
  def edit
    @project = Project.find(params[:id])
    @teams=Team.all
  end
  
  def update
    if @project=Project.find(params[:id])
      if @project.update_attributes(params[:project])
      redirect_to projects_url
      else
        render :action => :edit
      end
    else
      redirect_to projects_url
    end
  end
end
