class HolidayBookingsController < ApplicationController
before_filter :require_holder, :setVars
before_filter :store_location, :except=>[:new, :edit, :update]

  def index
    @holiday_bookings = current_holder.holiday_bookings.paginate :page => params[:page], :per_page => params[:per_page]
  end
  
  def new
    @holiday_booking = current_holder.holiday_bookings.new
  end
  
  def create
    @holiday_booking = current_holder.holiday_bookings.build(params[:holiday_booking])
    if @holiday_booking.save
      redirect_to holiday_bookings_url
    else
      render :new
    end
  end
  
  def edit
    @holiday_booking = current_holder.holiday_bookings.find(params[:id])
  end
  
  def update
    @holiday_booking = current_holder.holiday_bookings.find(params[:id])
    if @holiday_booking.update_attributes(params[:holiday_booking])
      redirect_to holiday_bookings_url
    else
      render :edit
    end
  end
  
  def destroy
    @holiday_booking = current_holder.holiday_bookings.find(params[:id])
    if @holiday_booking.destroy
      flash[:notice] = "booking deleted!"
      redirect_to holiday_bookings_url
    else
      flash[:notice] = "your booking could not be deleted at this point, please try again later!"
      redirect_to holiday_bookings_url
    end
  end
end
