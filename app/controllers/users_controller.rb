class UsersController < ApplicationController
  before_action :on_call_booking, :set_user, only: %i[on_call on_duty default]
  # before_action :set_user, only: %i[on_call on_duty default]
  def on_call
    planning_date
    # @booking_contact = Booking.find_by(date: Date.today, on_call: true)
    # @contact = @booking_contact.user
  end

  def on_duty
    planning_date
    (@on_call_booking)?(@on_call_contact):(@on_call_contact = "Attention pas d'attribution")
  end

  def default
    planning_date
    @on_duty_contact = Booking.find_by(date: Date.today, on_call: false).user
  end

  def update
    # @on_call = Booking.find_by(date: Date.today, on_call: true)
    # @contact = @on_call.user
    @on_call_contact = User.find(params[:id])
    @on_call_contact.update(deplacement: params[:deplacement].to_i)
    redirect_to contact_path if @on_call_contact.called?
    redirect_to map_path if @on_call_contact.accepted?
    redirect_to on_call_path if @on_call_contact.rejected?
    redirect_to on_call_path if @on_call_contact.uncalled?
    # enum :deplacement, { uncalled: 0, called: 1, accepted: 2, rejected: 3 }
  end

  def uncalled_to_called
    @contact = User.find(params[:id])
    @contact.update(deplacement: 1)
  end

  def get_doctors
    date = params[:date]
    bookings = Booking.where(date: date).where.not(on_call: nil)
    if bookings == []
      render json: [{ last_name: "non attribuée" }, { last_name: "non attribuée" }, { first_name: "" }, { first_name: "" }]
    else
      astreinte = bookings.find_by_on_call(true).user
      de_garde = bookings.find_by_on_call(false).user
      render json: [{ last_name: astreinte.last_name }, { last_name: de_garde.last_name }, { first_name: astreinte.first_name }, { first_name: de_garde.first_name }]
    end
  end

  private

  def on_call_booking
    @on_call_booking = Booking.find_by(date: Date.today, on_call: true)
    @on_call_contact = @on_call_booking.user
    # @contact = @booking_contact.user


  end

  def set_user
    @booking_user = Booking.find_by(date: Date.today, user: current_user)


  end



  def planning_date
    @user = current_user
    if Booking.find_by(user: current_user) == nil
      # raise
      @on_call = nil
      @on_duty = nil
    else
      # raise
    # @booking_user = Booking.find_by(date: Date.today, user: current_user)
    @on_call = current_user.next_booking(true)
    @on_duty = current_user.next_booking(false)
    end
  end
end

  # def planning_date
  #  @user = current_user
  #  @booking = Booking.find_by(date: Date.today, user: current_user)
  #  @on_calls = Booking.all.where(on_call: true, user: current_user)
  #  if  @on_calls.first.date.to_date == Date.today
  #    @on_call = @on_calls.second
  #  else
  #    @on_call = @on_calls.first
  #  end

  #  @on_duty = Booking.all.where(on_call: false, user_id: current_user)
  #  if @on_duty.first.date.to_date == Date.today
  #    @on_duty = @on_duty.second
  #  else
  #    @on_duty = @on_duty.first
  #  end
  # end
