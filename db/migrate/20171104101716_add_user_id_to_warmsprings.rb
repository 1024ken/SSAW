class AddUserIdToWarmsprings < ActiveRecord::Migration[5.1]
  def change
    add_column :warmsprings, :user_id, :integer
    add_column :warmsprings, :image, :string
  end
end
