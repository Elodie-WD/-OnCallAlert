class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @booking = Booking.where(date: Date.today, user: current_user).first
  end
end

