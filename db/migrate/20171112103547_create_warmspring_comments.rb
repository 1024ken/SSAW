class CreateWarmspringComments < ActiveRecord::Migration[5.1]
  def change
    create_table :warmspring_comments do |t|
      t.references :user, foreign_key: true
      t.references :warmspring, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
