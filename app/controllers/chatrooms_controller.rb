class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
    search_contact

    # @booking = Booking.where(date: Date.today, user: current_user).first
    # if @booking.on_call
    #   @title = "Personne de Garde"
    #   @on_duty = Booking.where(date: Date.today, on_call: false).first.user_id
    #   @contact = User.all.find { |user| user.id == @on_duty }
    # elsif !@booking.on_call
    #   @title = "Personne d'Astreinte"
    #   @on_call = Booking.where(date: Date.today, on_call: true).first.user_id
    #   @contact = User.all.find { |user| user.id == @on_call }
    # end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @chatroom.messages.where.not(user: current_user).update(viewed: true)
    @message = Message.new
    search_contact
  end

  private

  def search_contact
    @booking = Booking.where(date: Date.today, user: current_user).first
    if @booking.on_call
      @title = "Personne de Garde"
      @on_duty = Booking.where(date: Date.today, on_call: false).first.user_id
      @contact = User.all.find { |user| user.id == @on_duty }
    elsif !@booking.on_call
      @title = "Personne d'Astreinte"
      @on_call = Booking.where(date: Date.today, on_call: true).first.user_id
      @contact = User.all.find { |user| user.id == @on_call }
    end
  end
end
