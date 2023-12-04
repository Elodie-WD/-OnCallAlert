class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @booking = Booking.where(date: Date.today, user: current_user).first
  end

  def update
    @booking = Booking.find_by(date: Date.today, user: current_user)
    @booking.update!(status: true)
    redirect_to on_call_path
  end
end

