class AddDefaultDeplacementToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :deplacement, :integer, default: 0
  end
end
