class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # @booking = Booking.new
    # @booking.user_id == current_user
    @booking = Booking.where(date: Date.today, user: current_user).first
  end

  def rooting
    @booking = Booking.where(date: Date.today, user: current_user).first
    if @booking.on_call
      redirect_to on_call_path
    elsif !@booking.on_call
      redirect_to on_duty_path
    else
      redirect_to default_path
    end
  end
end
