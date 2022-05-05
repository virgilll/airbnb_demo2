class BookingsController < ApplicationController
  def new
    @flat = Flat.find(params[:id])
    @booking = Booking.new
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.flat = @flat
    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def change_status
    @booking = Booking.find(params[:id])
    if params[:status].present?
      @booking.update(status: params[:status])
    end
    redirect_to user_path(current_user)
  end

  def destroy
    @booking = Booking.find(params[:id]) # not sure
    @flat = @booking.flat
    @booking.destroy
    redirect_to flat_path(@flat) # not sure about the path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
