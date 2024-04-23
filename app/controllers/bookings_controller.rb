class BookingsController < ApplicationController
before_action :bookings_all, only: %i[index planning new create]
before_action :booking_set, only: %i[planning new]

  def index
    @booking = Booking.where(date: "dateselection")
  end

  def planning
    @users = User.all
  end

  def new
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

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to planning_path, status: :see_other

  end
  private

  def booking_params
    params.require(:booking).permit(:on_call, :date, :user_id)
  end

  def bookings_all
    @bookings = Booking.all
  end

  def booking_set
    @booking = Booking.new
  end
end
