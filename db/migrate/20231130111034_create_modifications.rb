class CreateModifications < ActiveRecord::Migration[7.1]
  def change
    create_table :modifications do |t|
      t.string :content
      t.references :notification, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
