class ChatroomsController < ApplicationController
  # before_action :chatroom_user, only: %i[]
  def index
    chatroom_user

    # @chatrooms = Chatroom.all
    # search_contact
    # chatroom_contact(date)

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
    # search_contact
  end

  private
  def chatroom_user
    bookings_user = Booking.where(user: current_user).where("date < ?", Date.current)
    booking_date_user = bookings_user.map{|booking| booking.date.strftime("%Y-%m-%d")}
    @chatrooms_user = booking_date_user.map{|date| Booking.where(date:date).where.not(user:current_user)}.flatten.map{|booking| Chatroom.find_by(date: booking.date)}
  end
  # def chatroom_contact(date)
  #   booking_contact = Booking.all.where(date: date).where.not(user: current_user).first.user
  #   chatroom_contact = booking_contact.first.user.first_name
  # end

  # def search_contact
  #   @booking = Booking.where(date: Date.today, user: current_user).first
  #   if @booking.on_call
  #     @title = "Personne de Garde"
  #     @on_duty = Booking.where(date: Date.today, on_call: false).first.user_id
  #     @contact = User.all.find { |user| user.id == @on_duty }
  #   elsif !@booking.on_call
  #     @title = "Personne d'Astreinte"
  #     @on_call = Booking.where(date: Date.today, on_call: true).first.user_id
  #     @contact = User.all.find { |user| user.id == @on_call }
  #   end
  # end




  # def chatroom_contact
  #   booking_user
  #   booking_contacts = booking_date_user.map{|date| Booking.all.where(date:date).where.not(user:current_user)}.flatten.map{|booking| booking.user.first_name}
  #   # booking_contacts = booking_date_user.map{|date| Booking.all.where(date:date).where.not(user:current_user)}.flatten.map{|booking| [booking.user.first_name, booking.date.strftime("%Y-%m-%d"), (Chatroom.all.find_by(date: booking.date)).name]}
  #   # [["Dr. Alice", "2023-11-28", "Chatroom2"], ["Dr. Benoit", "2023-12-02", "Chatroom3"]]
  #   # donne les booking du current_user du jour et anterieur


  #   # ["2023/11/28", "2023/12/02"]
  #   # booking_contacts = booking_date_user.map{|date| Booking.all.where(date:date).where.not(user:current_user)}.flatten.map{|booking| booking.user.first_name}
  #   # booking_contacts = booking_date_user.map{|date| Booking.all.where(date:date).where.not(user:current_user)}.flatten.map{|booking| [booking.user.first_name, booking.date.strftime("%Y-%m-%d")]}
  #   # [["Dr. Alice", "2023/11/28"], ["Dr. Benoit", "2023/12/02"]]

  # end
end

# >> bookings_user = Booking.all.where("date <= ?", Date.current).where(user: current_user)

# Permet d'obtenir le correspondant mais seulement si un message est écrit par celui-ci
# Message.all.where(chatroom: 539).where.not(user: current_user).first.user.first_name
