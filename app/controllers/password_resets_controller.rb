class PasswordResetsController < ApplicationController
  before_filter :load_holder_using_perishable_token, :only => [:edit, :update]
  before_filter :require_no_holder
  
  def new
    render
  end
  
  def create
    @holder = Holder.find_by_email(params[:email])
    if @holder
      @holder.deliver_password_reset_instructions!
      flash[:notice] = "<p class='notice'>Instructions to reset your password have been emailed to you. " +
        "Please check your email.</p>"
      redirect_to login_url
    else
      flash[:notice] = '<span class="warning">No holder was found with that email address</span>'
      render :action => :new
    end
  end
  
  def edit
    render
  end

  def update
    @holder.password = params[:holder][:password]
    @holder.password_confirmation = params[:holder][:password_confirmation]
    if @holder.save
      flash[:notice] = '<span class="notice">Password successfully updated</span>'
      redirect_to edit_holder_url(@holder)
    else
      render :action => :edit
    end
  end

  private
    def load_holder_using_perishable_token
      @holder = Holder.find_using_perishable_token(params[:id])
      unless @holder
        flash[:notice] = "<span class='warning'>We're sorry, but we could not locate your account." +
          "If you are having issues try copying and pasting the URL " +
          "from your email into your browser or restarting the " +
          "reset password process.</span>"
        redirect_to root_url
      end
    end
end