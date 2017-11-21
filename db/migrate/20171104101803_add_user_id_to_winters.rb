class AddUserIdToWinters < ActiveRecord::Migration[5.1]
  def change
    add_column :winters, :user_id, :integer
    add_column :winters, :image, :string
  end
end
