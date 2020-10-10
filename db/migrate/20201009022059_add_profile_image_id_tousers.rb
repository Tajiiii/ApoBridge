class AddProfileImageIdTousers < ActiveRecord::Migration[5.2]
  def change
  	add column :users, profile_image_id, :string
  end
end
