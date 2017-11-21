class AddUserIdToSummers < ActiveRecord::Migration[5.1]
  def change
    add_column :summers, :user_id, :integer
    add_column :summers, :image, :string
  end
end
