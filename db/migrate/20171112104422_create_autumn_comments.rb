class CreateAutumnComments < ActiveRecord::Migration[5.1]
  def change
    create_table :autumn_comments do |t|
      t.references :user, foreign_key: true
      t.references :autumn, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
