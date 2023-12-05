class AddViewedToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :viewed, :boolean
  end
end
