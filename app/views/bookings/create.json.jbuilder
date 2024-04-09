if @booking.persisted?
  json.form render(partial: "bookings/form", formats: :html, locals: {booking: Booking.new})
  json.inserted_item render(partial: "bookings/booking", formats: :html, locals: {booking: @booking})
  json.extract! @booking, :date
else
  json.form ""
end
