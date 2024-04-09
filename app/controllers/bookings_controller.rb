class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @booking = Booking.where(date: "dateselection")
  end

  def planning
    @bookings = Booking.all
    @booking = Booking.new
    @users = User.all
  end

  def new
    @bookings = Booking.all
    @booking = Booking.new
    @users = User.all
  end

  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if @booking.save
        format.html { redirect_to planning_path, notice: "Booking was successfully created." }
        format.json
      else
        format.html { render :planning, status: :unprocessable_entity }
        format.json
      end
    end
    @bookings = Booking.all
    # if @booking.save
    #   redirect_to planning_path
    # else
    # render :planning, status: :unprocessable_entity
    # end
  end

  def update
    @booking = Booking.find_by(date: Date.today, user: current_user)
    @booking.update!(status: true)
    redirect_to on_call_path, notice:"Vous avez validé votre astreinte!"
  end
  private

  def booking_params
    params.require(:booking).permit(:on_call, :date, :user_id)
  end
end
