class UsersController < ApplicationController
  def on_call
    planning_date
    @booking_contact = Booking.find_by(date: Date.today, on_call: true)
    @contact = @booking_contact.user
  end

  def on_duty
    planning_date
    @booking_contact = Booking.find_by(date: Date.today, on_call: true)
    @contact = @booking_contact.user
  end

  def default
    planning_date
  end

  def update
    #@on_call = Booking.find_by(date: Date.today, on_call: true)
    #@contact = @on_call.user
    @contact = User.find(params[:id])
    @contact.update(deplacement: params[:deplacement].to_i)
    redirect_to contact_path if @contact.called?
    redirect_to map_path if @contact.accepted?
    redirect_to on_call_path if @contact.rejected?
    redirect_to on_call_path if @contact.uncalled?
    # enum :deplacement, { uncalled: 0, called: 1, accepted: 2, rejected: 3 }
  end

  def uncalled_to_called
    @contact = User.find(params[:id])
    @contact.update(deplacement: 1)
  end

  def get_doctors
    date = params[:date]
    bookings = Booking.where(date: date).where.not(on_call: nil)
    astreinte = bookings.find_by_on_call(true).user
    de_garde = bookings.find_by_on_call(false).user
    render json: [ { last_name: astreinte.last_name }, { last_name: de_garde.last_name} ]
  end

  private

  #def planning_date
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
  #end

  def planning_date
    @user = current_user
    @booking = Booking.find_by(date: Date.today, user: current_user)
    @on_call = current_user.next_booking(true)
    @on_duty = current_user.next_booking(false)
  end
end
