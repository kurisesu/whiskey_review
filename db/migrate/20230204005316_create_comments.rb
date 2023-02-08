class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.timestamps
      t.integer :genre_id
      t.integer :review_id
      t.string :whiskey_name
      t.integer :star
      t.text :comment

    end
  end
end
