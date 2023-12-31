class ContactsController < ApplicationController
  def show
    @booking = Booking.where(date: Date.today, user: current_user).first
    if @booking.on_call
      @title = "Personne de garde"
      @on_duty = Booking.where(date: Date.today, on_call: false).first.user_id
      @contact = User.all.find { |user| user.id == @on_duty }
    elsif !@booking.on_call
      @title = "Personne d'astreinte"
      @on_call = Booking.where(date: Date.today, on_call: true).first.user_id
      @contact = User.all.find { |user| user.id == @on_call }
    else
      redirect_to default_path
    end

    @chatroom = Chatroom.find_or_create_by(department: current_user.department, date: Date.today)
  end
end
