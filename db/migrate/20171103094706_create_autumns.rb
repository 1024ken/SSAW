class CreateAutumns < ActiveRecord::Migration[5.1]
  def change
    create_table :autumns do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
