class AddUserIdToAutumns < ActiveRecord::Migration[5.1]
  def change
    add_column :autumns, :user_id, :integer
    add_column :autumns, :image, :string
  end
end
