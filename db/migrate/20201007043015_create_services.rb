class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.integer :user_id
      t.string :name
      t.text :introduction
      t.string :price
      t.integer :category_id
      t.string :area

      t.timestamps
    end
  end
end
