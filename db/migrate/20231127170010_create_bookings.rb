class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.boolean :on_call
      t.string :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
