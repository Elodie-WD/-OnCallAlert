class UsersController < ApplicationController


  def on_call
    planning_date
  end

  def on_duty
    planning_date
    @booking_contact = Booking.find_by(date: Date.today, on_call: true)
  end

  def default
    planning_date
  end

  def update
    @on_call = Booking.find_by(date: Date.today, on_call: true).user_id
    @contact = User.all.find { |user| user.id == @on_call }
    @contact.called!
    redirect_to contact_path
    # enum :deplacement, { uncalled: 0, called: 1, accepted: 2, rejected: 3 }
  end

  def get_doctors
    date = params[:date]
    bookings = Booking.where(date: date).where.not(on_call: nil)
    astreinte = bookings.find_by_on_call(true).user
    de_garde = bookings.find_by_on_call(false).user
    render json: [ { last_name: astreinte.last_name }, { last_name: de_garde.last_name} ]
  end

  private

  def planning_date
    @user = current_user
    @booking = Booking.find_by(date: Date.today, user: current_user)
    @on_call = Booking.all.where(on_call: true, user: current_user)
    if Booking.all.where(on_call: true, user_id: current_user).first.date.to_date == Date.today
      @on_call = @on_call.second
    else
      @on_call = @on_call.first
    end

    @on_duty = Booking.all.where(on_call: false, user_id: current_user)
    if Booking.all.where(on_call: false, user_id: current_user).first.date.to_date == Date.today
      @on_duty = @on_duty.second
    else
      @on_duty = @on_duty.first
    end
  end
end
