class ChangePasswordController < ApplicationController
    before_filter :require_holder, :setVars
    
    def index
      render
    end

    def update
      if params[:holder][:password].blank? and params[:holder][:password_confirmation].blank?
        flash[:notice] = '<p class="notice">Please fill in the password fields</p>'
        redirect_to holder_change_password_index_url(current_holder)
      else
        current_holder.password = params[:holder][:password]
        current_holder.password_confirmation = params[:holder][:password_confirmation]
      
        if current_holder.save
          flash[:notice] = '<p class="notice">Password successfully updated</p>'
          redirect_to edit_holder_url(current_holder)
        else
          flash[:notice] = '<p class="notice">There has been a problem saving your new password, Please try again later</p>'
          redirect_to holder_change_password_index_url(current_holder)
        end
      end
    end
end
