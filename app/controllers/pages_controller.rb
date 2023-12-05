class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :set_booking, only: %i[home rooting]
  def home
  end

  def rooting
    if @booking.on_call
      redirect_to on_call_path
    elsif @booking.on_call == false
      redirect_to on_duty_path
    else
      redirect_to default_path
    end
  end

  private

  def set_booking
    @booking = Booking.where(date: Date.today, user: current_user).first
  end
end
