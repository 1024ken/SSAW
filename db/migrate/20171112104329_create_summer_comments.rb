class CreateSummerComments < ActiveRecord::Migration[5.1]
  def change
    create_table :summer_comments do |t|
      t.references :user, foreign_key: true
      t.references :summer, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
