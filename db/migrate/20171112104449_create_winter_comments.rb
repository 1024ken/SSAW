class CreateWinterComments < ActiveRecord::Migration[5.1]
  def change
    create_table :winter_comments do |t|
      t.references :user, foreign_key: true
      t.references :winter, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
