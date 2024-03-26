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
    # raise
    if @booking.save
      redirect_to planning_path
    else
    render :new, status: :unprocessable_entity
    end
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
