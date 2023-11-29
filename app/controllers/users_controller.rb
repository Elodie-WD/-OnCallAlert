class UsersController < ApplicationController

  def on_call
    @on_call = Booking.all.where(on_call: true, user_id: current_user)
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

  def on_duty
    @on_call = Booking.all.where(on_call: true, user_id: current_user)
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

  def default
    @booking = Booking.where(date: Date.today, user: current_user).first
  end
end
