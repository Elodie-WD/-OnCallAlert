class AddColumnToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :grade, :string
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :picture, :string
    add_column :users, :job_title, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :deplacement, :integer
  end
end
