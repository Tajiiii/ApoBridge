class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :visiter_id
      t.string :integer
      t.integer :visited_id
      t.integer :service_id
      t.string :action
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
