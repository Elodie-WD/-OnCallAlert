class MapsController < ApplicationController
  def show
    @booking_contact = Booking.find_by(date: Date.today, on_call: true)
    @contact = @booking_contact.user
  end
end
