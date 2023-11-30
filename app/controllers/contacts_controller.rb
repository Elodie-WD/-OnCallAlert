class ContactsController < ApplicationController
  def show
    @booking = Booking.where(date: Date.today, user: current_user).first
    if @booking.on_call
      @title = "Personne de Garde"
      @on_duty = Booking.where(date: Date.today, on_call: false).first.user_id
      @users = User.all
      @contact = @users.find { |user| user.id == @on_duty }
    elsif !@booking.on_call
      @title = "Personne d'Astreinte"
      @on_call = Booking.where(date: Date.today, on_call: true).first.user_id
      @users = User.all
      @contact = @users.find { |user| user.id == @on_call }
    else
      redirect_to default_path
    end

    @chatroom = Chatroom.find_or_create_by(department: current_user.department, date: Date.today)
  end
end
