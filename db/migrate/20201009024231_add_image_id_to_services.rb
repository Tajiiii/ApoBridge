class AddImageIdToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :image_id, :string
  end
end
