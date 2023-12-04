class AddStatusToBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :status, :boolean, default: false
  end
end
