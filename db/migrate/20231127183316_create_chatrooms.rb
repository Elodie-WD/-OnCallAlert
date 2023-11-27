class CreateChatrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.references :department, null: false, foreign_key: true
      t.string :date

      t.timestamps
    end
  end
end
