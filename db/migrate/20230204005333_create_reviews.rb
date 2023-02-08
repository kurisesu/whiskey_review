class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.timestamps
      t.integer :genre_id
      t.integer :admin_id
      t.string :whiskey_name
      t.text :introduction_text
      
    end
  end
end
