class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :service_id
      has_many :notifications, dependent: :destroy

      t.timestamps
    end
  end
end
