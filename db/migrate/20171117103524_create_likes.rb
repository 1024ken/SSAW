class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.string :likeable_type
      t.references :likeable
      t.references :user

      t.timestamps
    end
  end
end
